//
//  BaseCoordinator.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Foundation

class BaseCoordinator: NSObject, Coordinator {

    var childCoordinators: [Coordinator] = []

    func start(animated: Bool) {
        fatalError("start(animated:) has not been implemented")
    }

    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    func clearDependencies() {
        childCoordinators.removeAll()
    }
}
