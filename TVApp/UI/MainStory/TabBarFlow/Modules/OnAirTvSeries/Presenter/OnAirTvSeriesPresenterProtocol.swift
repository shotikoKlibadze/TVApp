//
//  OnAirTvSeriesPresenterProtocol.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Foundation

protocol OnAirTvSeriesPresenter: Presentable, TabBarPresentable {}

protocol OnAirTvSeriesPresenterOutput: AnyObject {
    func onAirPresenterDidShow(tvSeries: TvSeries)
}
