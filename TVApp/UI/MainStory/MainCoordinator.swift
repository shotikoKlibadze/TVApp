//
//  MainCoordinator.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Swinject

final class MainCoordinator: BaseCoordinator {

    var router: Router!
    var coordinatorResolver: Resolver!
    weak var output: MainCoordinatorOutput?
   
    override func start(animated: Bool) {
        runTabBarFlow(animated: animated)
    }
}

private extension MainCoordinator {
    
    func runTabBarFlow(animated: Bool) {
        guard let coordinator = coordinatorResolver.resolve(TabBarCoordinator.self, arguments: router, self as TabBarCoordinatorOutput) else {
            assertionFailure("Failed to resolve \(TabBarCoordinator.self)")
            return
        }
        addDependency(coordinator)
        coordinator.start(animated: animated)
    }
    
    func runDetailsFlow(animated: Bool, tvSeries: TvSeries) {
        guard let coordinator = coordinatorResolver.resolve(SeriesDetialsCoordinator.self, arguments: router, self as SeriesDetialsCoordinatorOutput , tvSeries) else {
            assertionFailure("Failed to resolve \(TabBarCoordinator.self)")
            return
        }
        addDependency(coordinator)
        coordinator.start(animated: animated)
    }
}

extension MainCoordinator: TabBarCoordinatorOutput {
    func coordinatorDidRunDetailsFlow(tvSeries: TvSeries) {
        runDetailsFlow(animated: true, tvSeries: tvSeries)
    }
}

extension MainCoordinator: SeriesDetialsCoordinatorOutput {
    func detailsCoordinatorDidFinis(_ coordinator: SeriesDetialsCoordinator) {
        removeDependency(coordinator)
        router.popModule()
    }
}
