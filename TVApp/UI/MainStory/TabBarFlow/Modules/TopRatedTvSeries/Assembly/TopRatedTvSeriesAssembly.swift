//
//  TopRatedTvSeriesAssembly.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Swinject

extension UI.TopRatedTvSeries {
    
    final class Assembly: Swinject.Assembly {

        typealias View = TopRatedTvSeriesViewController
        typealias Output = TopRatedTvSeriesPresenterOutput
        
        func assemble(container: Swinject.Container) {
            container.register(Presenter.self) { (resolver, output: Output) in
                let presenter = Presenter()
                let viewController = View.loadFromStoryboard()
                viewController.output = presenter
                presenter.view = viewController
                presenter.output = output
                presenter.service = resolver.resolve(TopRatedTvSeriesService.self)
                return presenter
            }
        }
    }
}
