//
//  SceneDelegate.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private var assembler: Assembler!
    private var appCoordinator: App.Coordinator!
    
    lazy var rootController: UINavigationController = {
        let rootController = UINavigationController()
        rootController.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        return rootController
    }()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        resolveDependencies()
        setupWindow(with: scene)
        startFlow()
    }
}

private extension SceneDelegate {
    
    func setupWindow(with scene: UIWindowScene) {
        let window = UIWindow(frame: scene.coordinateSpace.bounds)
        window.backgroundColor = UIColor.white
        window.windowScene = scene
        self.window = window
    }
    
    func resolveDependencies() {
        assembler = App.DIResolver.resolveDependencies()
    }
    
    func startFlow() {
        let applicationCoordinator = assembler.resolver.resolve(App.Coordinator.self,
                                                                argument: rootController)
        appCoordinator = applicationCoordinator
        applicationCoordinator?.start(animated: false)
    }
}
