//
//  OnAirTvSeriesView.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Foundation

protocol OnAirTvSeriesView: Presentable {}

protocol OnAirTvSeriesViewOutput: AnyObject {
    func viewDidLoad()
    func viewDidTapTvSeries()
}
