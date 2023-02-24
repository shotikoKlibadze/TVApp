//
//  TabBarPresenterProtocol.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Foundation

protocol TabBarPresenter: Presentable {
    func setup(views: [TabBarPresentable])
}

protocol TabBarPresenterOutput: AnyObject {}
