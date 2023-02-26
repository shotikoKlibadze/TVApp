//
//  TopRatedTvSeriesView.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Foundation

protocol TopRatedTvSeriesView: Presentable {
    func setupView()
}

protocol TopRatedTvSeriesViewOutput: AnyObject {
    func viewDidLoad()
    func viewDidTapTvSeries(at index: Int)
    func viewDidGetTvSeriesCount() -> Int
    func viewDidGetTvSeriesToShow() -> [TvSeries]
}
