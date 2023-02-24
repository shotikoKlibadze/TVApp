//
//  TabBarCoordinator.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Swinject

final class TabBarCoordinator: BaseCoordinator {
    
    var router: Router!
    var resolver: Resolver!
    weak var output: TabBarCoordinatorOutput?
    private var tabBarPresenter: TabBarPresenter?

    override func start(animated: Bool) {
        showTabBar(animated: animated)
    }
}

private extension TabBarCoordinator {
    
    func showTabBar(animated: Bool) {
        guard let presenter = resolver.resolve(UI.TabBar.Presenter.self, argument: self as TabBarPresenterOutput) else {
            assertionFailure("Failed to resolve \(UI.TabBar.Presenter.self)")
            return
        }
        let views = [createOnAirSeriese(), createTopRatedSeries()].compactMap({$0})
        presenter.setup(views: views)
        tabBarPresenter = presenter
        router.setRootModule(presenter, hideBar: true, animated: animated)
    }
    
    func createOnAirSeriese() -> TabBarPresentable? {
        guard let presenter = resolver.resolve(UI.OnAirTvSeries.Presenter.self, argument: self as OnAirTvSeriesPresenterOutput) else {
            assertionFailure("Failed to resolve \(UI.TabBar.Presenter.self)")
            return nil
        }
       return presenter
    }
    
    func createTopRatedSeries() -> TabBarPresentable? {
        guard let presenter = resolver.resolve(UI.TopRatedTvSeries.Presenter.self, argument: self as TopRatedTvSeriesPresenterOutput) else {
            assertionFailure("Failed to resolve \(UI.TabBar.Presenter.self)")
            return nil
        }
        return presenter
    }
}


extension TabBarCoordinator: TabBarPresenterOutput {
    
}

extension TabBarCoordinator: OnAirTvSeriesPresenterOutput {
    
}

extension TabBarCoordinator: TopRatedTvSeriesPresenterOutput {
    
}
