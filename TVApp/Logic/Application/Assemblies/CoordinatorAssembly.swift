//
//  CoordinatorAssembly.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Swinject

final class CoordinatorAssembly: Assembly {
    
    func assemble(container: Swinject.Container) {
        //MARK: APP
        container.register(Router.self) { (_, rootController: UINavigationController) in
            MainRouter(rootController: rootController)
        }
        
        container.register(App.Coordinator.self) { (resolver, rootController: UINavigationController) in
            let coordinator = App.Coordinator()
            coordinator.router = resolver.resolve(Router.self, argument: rootController)
            coordinator.coordinatorResolver = resolver
            return coordinator
        }.inObjectScope(.container)
    }
}
