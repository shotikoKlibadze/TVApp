//
//  SeriesDetailsView.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 26.02.23.
//

import Foundation

protocol SeriesDetailsView: Presentable {
    func setupView(with series: TvSeries)
}

protocol SeriesDetailsViewOutput: AnyObject {
    func viewDidLoad()
    func viewDidTapBackButton()
}
