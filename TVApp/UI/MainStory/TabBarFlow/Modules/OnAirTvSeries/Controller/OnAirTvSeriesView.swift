//
//  OnAirTvSeriesView.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Foundation

protocol OnAirTvSeriesView: Presentable {
    func setupView()
}

protocol OnAirTvSeriesViewOutput: AnyObject {
    func viewDidLoad()
    func viewDidTapTvSeries(at index: Int)
    func viewDidGetTvSeriesCount() -> Int
    func viewDidGetTvSeriesToShow() -> [TvSeries]
}
