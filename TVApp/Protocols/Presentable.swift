//
//  Presentable.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import UIKit

protocol Presentable: AnyObject {

    func toPresent() -> UIViewController?
}

// MARK: - UIViewController
extension UIViewController: Presentable {

    func toPresent() -> UIViewController? {
        return self
    }
}

