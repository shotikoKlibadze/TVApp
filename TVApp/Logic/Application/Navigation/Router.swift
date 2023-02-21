//
//  Router.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import UIKit

typealias VoidBlock = () -> ()

protocol Router: Presentable {

    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    func present(_ module: Presentable?, animated: Bool, completion: VoidBlock?)

    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: VoidBlock?)

    func popModule()
    func popModule(animated: Bool)
    func pop(to moduleType: UIViewController.Type, animated: Bool)

    func dismissModule()
    func dismissModule(animated: Bool, completion: VoidBlock?)

    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    func setRootModule(_ module: Presentable?, hideBar: Bool, animated: Bool)

    func popToRootModule(animated: Bool)
    func setModules(_ modules: [Presentable]?, animated: Bool)
}

// MARK: -
final class MainRouter {

    private unowned var rootController: UINavigationController
    private var completions: [UIViewController : VoidBlock] = [:]

    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
}

// MARK: - Router
extension MainRouter: Router {
    
    func toPresent() -> UIViewController? {
        return rootController
    }
    
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }

    func present(_ module: Presentable?, animated: Bool) {
        present(module, animated: animated, completion: nil)
    }

    func present(_ module: Presentable?, animated: Bool, completion: VoidBlock?) {
        guard let controller = module?.toPresent() else { return }
        rootController.present(controller,
                               animated: animated,
                               completion: completion)
    }

    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }

    func dismissModule(animated: Bool, completion: VoidBlock?) {
        rootController.dismiss(animated: animated, completion: completion)
    }

    func push(_ module: Presentable?) {
        push(module, animated: true)
    }

    func push(_ module: Presentable?, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }

    func push(_ module: Presentable?, animated: Bool, completion: VoidBlock?) {
        guard let controller = module?.toPresent(),
            (controller is UINavigationController == false)
        else {
            assertionFailure("Deprecated push UINavigationController.")
            return
        }

        if let completion = completion {
            completions[controller] = completion
        }
       
        rootController.pushViewController(controller, animated: animated)
    }

    func popModule() {
        popModule(animated: true)
    }

    func popModule(animated: Bool) {
        if let controller = rootController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    func pop(to moduleType: UIViewController.Type, animated: Bool) {
        guard let moduleToPop = rootController.viewControllers.first(where: { $0.isKind(of: moduleType) })
        else { return }
        
        rootController.popToViewController(moduleToPop, animated: animated)
    }

    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false, animated: true)
    }

    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        setRootModule(module, hideBar: hideBar, animated: true)
    }

    func setRootModule(_ module: Presentable?,
                       hideBar: Bool,
                       animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        
        rootController.setViewControllers([controller], animated: animated)
        rootController.isNavigationBarHidden = hideBar
    }

    func popToRootModule(animated: Bool) {
        if let controllers = rootController.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }

    func setModules(_ modules: [Presentable]?, animated: Bool) {
        guard let views = modules?.compactMap({ $0.toPresent() }), !views.isEmpty
        else { return }

        rootController.setViewControllers(views, animated: animated)
    }
}

// MARK: - Private
private extension MainRouter {

    func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        
        completion()
        completions.removeValue(forKey: controller)
    }
}
