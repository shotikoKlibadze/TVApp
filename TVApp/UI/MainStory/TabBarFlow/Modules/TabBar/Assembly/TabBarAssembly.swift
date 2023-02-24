//
//  TabBarAssembly.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Foundation
import Swinject

extension UI.TabBar {

    class Assembly: Swinject.Assembly {

        typealias View = TabBarViewController
        typealias Output = TabBarPresenterOutput

        func assemble(container: Container) {
            container.register(Presenter.self) { (_, output: Output) in
                let presenter = Presenter()
                let viewController = View.loadFromStoryboard()
                viewController.output = presenter
                presenter.view = viewController
                presenter.output = output
                return presenter
            }
        }
    }
}
