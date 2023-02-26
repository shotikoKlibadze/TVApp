//
//  SeriesDetailsPresenter.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 26.02.23.
//

import UIKit

extension UI.SeriesDetails {
    
    final class Presenter {
        
        weak var output: SeriesDetailsPresenterOuput?
        var view: SeriesDetailsView!
        var tvSeries: TvSeries!
    }
}

extension UI.SeriesDetails.Presenter: SeriesDetailsPresenter {
    
    func toPresent() -> UIViewController? {
        view?.toPresent()
    }
}

extension UI.SeriesDetails.Presenter: SeriesDetailsViewOutput {
    
    func viewDidTapBackButton() {
        output?.seriesDetailsPresenterDidFinish()
    }
    
    func viewDidLoad() {
        view.setupView(with: tvSeries)
    }
}
