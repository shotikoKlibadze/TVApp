//
//  TabBarView.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import UIKit

protocol TabBarView: Presentable {
    func updateTabBar(items: [TabBar.Item])
    func display(contentController: UIViewController)
    func hide(contentController: UIViewController)
}

protocol TabBarViewOutput: AnyObject {
    func viewDidLoad()
    func viewDidSelectTabBarItem(at index: Int)
}
