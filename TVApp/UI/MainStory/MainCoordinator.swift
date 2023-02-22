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
        
    }
}

private extension MainCoordinator {
    
    func runTabBarFlow(animated: Bool) {
        
    }
}
