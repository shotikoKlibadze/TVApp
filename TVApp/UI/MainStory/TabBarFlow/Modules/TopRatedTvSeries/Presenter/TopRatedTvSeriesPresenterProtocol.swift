//
//  TopRatedTvSeriesPresenterProtocol.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Foundation

protocol TopRatedTvSeriesPresenter: Presentable, TabBarPresentable {
}

protocol TopRatedTvSeriesPresenterOutput: AnyObject {
    func topRatedPresenterDidShow(tvSeries: TvSeries)
}
