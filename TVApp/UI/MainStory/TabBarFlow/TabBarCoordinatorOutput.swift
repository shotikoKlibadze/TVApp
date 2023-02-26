//
//  TabBarCoordinatorOutput.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Foundation

protocol TabBarCoordinatorOutput: AnyObject {
    func coordinatorDidRunDetailsFlow(tvSeries: TvSeries)
}
