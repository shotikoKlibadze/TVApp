//
//  ServiceAssembly.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Swinject

final class ServiceAssembly: Assembly {
    
    func assemble(container: Swinject.Container) {
        container.register(OnAirTvSeriesService.self) { _ in
            let service = OnAirTvSeriesRemoteDataRepository()
            return service
        }
        
        container.register(TopRatedTvSeriesService.self) { _ in
            let service = TopRatedTvSeriesRemoteDataRepository()
            return service
        }
    }
}
