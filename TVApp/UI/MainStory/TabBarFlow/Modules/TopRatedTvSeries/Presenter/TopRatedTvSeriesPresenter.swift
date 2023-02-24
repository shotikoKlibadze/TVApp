//
//  TopRatedTvSeriesPresenter.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import UIKit

extension UI.TopRatedTvSeries {
    
    final class Presenter {
        
        weak var output: TopRatedTvSeriesPresenterOutput?
        var view: TopRatedTvSeriesView!
        var service: TopRatedTvSeriesService!
    }
}

extension UI.TopRatedTvSeries.Presenter: Presentable {
    func toPresent() -> UIViewController? {
        view?.toPresent()
    }
}

extension UI.TopRatedTvSeries.Presenter: TopRatedTvSeriesPresenter {
    var icon: UIImage {
        UIImage(systemName: "film")!
    }
    
    var selectedIcon: UIImage {
        UIImage(systemName: "film.fill")!
    }
    
    func toPresent() -> UIViewController {
        view.toPresent()!
    }
}

extension UI.TopRatedTvSeries.Presenter: TopRatedTvSeriesViewOutput {
    
    func viewDidLoad() {
        
    }
    
    func viewDidTapTvSeries() {
        
    }
}
