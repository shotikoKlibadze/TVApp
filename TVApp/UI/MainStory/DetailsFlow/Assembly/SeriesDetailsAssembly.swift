//
//  SeriesDetailsAssembly.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 26.02.23.
//

import Foundation
import Swinject

extension UI.SeriesDetails {
    
    final class Assembly: Swinject.Assembly {

        typealias View = SeriesDetailsViewController
        typealias Output = SeriesDetailsPresenterOuput
        typealias Series = TvSeries
        
        func assemble(container: Swinject.Container) {
            container.register(Presenter.self) { (resolver, output: Output, series: Series) in
                let presenter = Presenter()
                let viewController = View.loadFromStoryboard()
                viewController.output = presenter
                presenter.view = viewController
                presenter.output = output
                presenter.tvSeries = series
                return presenter
            }
        }
    }
}
