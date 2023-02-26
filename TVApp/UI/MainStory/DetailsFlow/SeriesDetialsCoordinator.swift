//
//  SeriesDetialsCoordinator.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 26.02.23.
//

import Swinject

final class SeriesDetialsCoordinator: BaseCoordinator {
    
    var router: Router!
    var resolver: Resolver!
    var tvSeries: TvSeries!
    weak var output: SeriesDetialsCoordinatorOutput?
    var presenter: SeriesDetailsPresenter?
   
    override func start(animated: Bool) {
        runDetailsFlow(animated: animated)
    }
}

private extension SeriesDetialsCoordinator {
    
    func runDetailsFlow(animated: Bool) {
        guard let presenter = resolver.resolve(UI.SeriesDetails.Presenter.self, arguments: self as SeriesDetailsPresenterOuput, tvSeries!) else {
            assertionFailure("Failed to resolve \(UI.SeriesDetails.Presenter.self)")
            return
        }
        self.presenter = presenter
        router.push(presenter, animated: true)
    }
}

extension SeriesDetialsCoordinator: SeriesDetailsPresenterOuput {
    
    func seriesDetailsPresenterDidFinish() {
        output?.detailsCoordinatorDidFinis(self)
    }
}
