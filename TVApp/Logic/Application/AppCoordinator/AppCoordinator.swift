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
            
        }
        
    }
}
