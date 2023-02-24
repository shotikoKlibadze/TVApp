//
//  AppCoordinator.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Swinject

extension App {
    
    final class Coordinator: BaseCoordinator {
        
        var router: Router!
        var coordinatorResolver: Resolver!
        
        override init() {
            super.init()
        }

        override func start(animated: Bool) {
            startMainFlow(animated: animated)
        }
    }
}

private extension App.Coordinator {
    
    func startMainFlow(animated: Bool) {
        guard let coordinator = coordinatorResolver
                .resolve(MainCoordinator.self, arguments: router, self as MainCoordinatorOutput)
        else {
            assertionFailure("Failed to resolve \(MainCoordinator.self)")
            return
        }

        addDependency(coordinator)
        coordinator.start(animated: animated)
    }
}

extension App.Coordinator: MainCoordinatorOutput {
}
