//
//  TabBarPresentable.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import UIKit

protocol TabBarPresentable {

    var icon: UIImage { get }
    var selectedIcon: UIImage { get }
    var shouldShowBadge: Bool { get }
    var shouldReloadBadge: Bool { get }

    func toPresent() -> UIViewController

    func tabBarDidReloadBadge()
}

extension TabBarPresentable {

    var shouldShowBadge: Bool {
        false
    }

    var shouldReloadBadge: Bool {
        false
    }

    func tabBarDidReloadBadge() {}
}
