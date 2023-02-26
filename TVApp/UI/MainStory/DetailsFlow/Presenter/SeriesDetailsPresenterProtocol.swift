//
//  SeriesDetailsPresenterProtocol.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 26.02.23.
//

import Foundation

protocol SeriesDetailsPresenter: Presentable {}

protocol SeriesDetailsPresenterOuput: AnyObject {
    func seriesDetailsPresenterDidFinish()
}
