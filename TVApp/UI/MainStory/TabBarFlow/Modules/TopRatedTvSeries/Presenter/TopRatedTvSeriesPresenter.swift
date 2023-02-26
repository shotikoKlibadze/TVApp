//
//  TopRatedTvSeriesPresenter.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import UIKit
import ProgressHUD

extension UI.TopRatedTvSeries {
    
    final class Presenter {
        
        weak var output: TopRatedTvSeriesPresenterOutput?
        var view: TopRatedTvSeriesView!
        var service: TopRatedTvSeriesService!
        var tvSeries: [TvSeries] = []
    }
}

extension UI.TopRatedTvSeries.Presenter: Presentable {
    
    func toPresent() -> UIViewController? {
        view?.toPresent()
    }
}

extension UI.TopRatedTvSeries.Presenter: TopRatedTvSeriesPresenter {
    
    var icon: UIImage {
        UIImage(systemName: "film")!
    }
    
    var selectedIcon: UIImage {
        UIImage(systemName: "film.fill")!
    }
    
    func toPresent() -> UIViewController {
        view.toPresent()!
    }
}

extension UI.TopRatedTvSeries.Presenter: TopRatedTvSeriesViewOutput {
    
    func viewDidGetTvSeriesCount() -> Int {
        return tvSeries.count
    }
    
    func viewDidGetTvSeriesToShow() -> [TvSeries] {
        return tvSeries
    }
    
    func viewDidLoad() {
        ProgressHUD.show()
        Task {
            let result = await service.getTopRatedTvSeries()
            switch result {
            case .success(let tvSeries):
                self.tvSeries = tvSeries
                DispatchQueue.main.async {
                    self.view.setupView()
                }
                await ProgressHUD.dismiss()
            case .failure(let err):
                print(err.localizedDescription)
                await ProgressHUD.showError()
            }
        }
    }
    
    func viewDidTapTvSeries(at index: Int) {
        let tvSeries = tvSeries[index]
        output?.topRatedPresenterDidShow(tvSeries: tvSeries)
    }
}
