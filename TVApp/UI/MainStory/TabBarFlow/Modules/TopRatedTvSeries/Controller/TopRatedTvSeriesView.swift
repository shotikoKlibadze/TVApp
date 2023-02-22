//
//  TopRatedTvSeriesView.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Foundation

protocol TopRatedTvSeriesView: Presentable {}

protocol TopRatedTvSeriesViewOutput: AnyObject {
    func viewDidLoad()
    func viewDidTapTvSeries()
}
