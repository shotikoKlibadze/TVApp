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
        
        //MARK: - Main
        container.register(MainCoordinator.self) { (resolver, router: Router?, output: MainCoordinatorOutput) in
            let coordinator = MainCoordinator()
            coordinator.router = router
            coordinator.coordinatorResolver = resolver
            coordinator.output = output
            return coordinator
        }
    
        //MARK: - Tab Bar
        container.register(TabBarCoordinator.self) { (resolver, router: Router?, output: TabBarCoordinatorOutput) in
            let coordinator = TabBarCoordinator()
            coordinator.router = router
            coordinator.resolver = resolver
            coordinator.output = output
            return coordinator
        }
        
        //MARK: - Details
        container.register(SeriesDetialsCoordinator.self) { (resolver, router: Router?, output: SeriesDetialsCoordinatorOutput, series: TvSeries) in
            let coordinator = SeriesDetialsCoordinator()
            coordinator.router = router
            coordinator.resolver = resolver
            coordinator.output = output
            coordinator.tvSeries = series
            return coordinator
        }
    }
}
