//
//  OnAirTvSeriesPresenter.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import UIKit

extension UI.OnAirTvSeries {
    
    final class Presenter {
        
        weak var output: OnAirTvSeriesPresenterOutput?
        weak var view: OnAirTvSeriesView?
        var service: OnAirTvSeriesService!
    }
}

extension UI.OnAirTvSeries.Presenter: Presentable {
    
    func toPresent() -> UIViewController? {
        view?.toPresent()
    }
}

extension UI.OnAirTvSeries.Presenter: OnAirTvSeriesPresenter {}

extension UI.OnAirTvSeries.Presenter: OnAirTvSeriesViewOutput {
    
    func viewDidLoad() {
        
    }
    
    func viewDidTapTvSeries() {
        
    }
}
