//
//  TabBarViewController.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import UIKit

final class TabBarViewController: BaseViewController {
    
    weak var output: TabBarViewOutput?

    @IBOutlet private weak var tabBar: TabBar!
    @IBOutlet private weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        output?.viewDidLoad()
    }
    
}

extension TabBarViewController: TabBarView {
    
    func updateTabBar(items: [TabBar.Item]) {
        tabBar.configure(with: items)
    }
    
    func display(contentController: UIViewController) {
        let contentViewFrame = containerView.frame
        contentController.view.frame = contentViewFrame
        contentController.view.frame = CGRect(x: 0,
                                              y: 0,
                                          width: contentViewFrame.size.width,
                                         height: contentViewFrame.size.height)
        addChild(contentController)
        containerView.addSubview(contentController.view)
        contentController.didMove(toParent: self)
    }
    
    func hide(contentController: UIViewController) {
        contentController.willMove(toParent: nil)
        contentController.view.removeFromSuperview()
        contentController.removeFromParent()
    }
}

private extension TabBarViewController {
    
    func setupUI() {
        tabBar.onTapAction = { [weak self] index in
            self?.output?.viewDidSelectTabBarItem(at: index)
        }
    }
}
