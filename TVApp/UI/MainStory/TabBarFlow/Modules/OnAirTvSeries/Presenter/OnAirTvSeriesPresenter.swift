//
//  OnAirTvSeriesPresenter.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import UIKit
import ProgressHUD

extension UI.OnAirTvSeries {
    
    final class Presenter {
        
        weak var output: OnAirTvSeriesPresenterOutput?
        var view: OnAirTvSeriesView!
        var service: OnAirTvSeriesService!
        var tvSeries: [TvSeries] = []
    }
}

extension UI.OnAirTvSeries.Presenter: Presentable {
    func toPresent() -> UIViewController? {
        view?.toPresent()
    }
}

extension UI.OnAirTvSeries.Presenter: OnAirTvSeriesPresenter {
    func toPresent() -> UIViewController {
        view.toPresent()!
    }
    
    var icon: UIImage {
        UIImage(systemName: "tv")!
    }
    
    var selectedIcon: UIImage {
        UIImage(systemName: "tv.fill")!
    }
}

extension UI.OnAirTvSeries.Presenter: OnAirTvSeriesViewOutput {
    
    func viewDidGetTvSeriesCount() -> Int {
        return tvSeries.count
    }
    
    func viewDidGetTvSeriesToShow() -> [TvSeries] {
        return tvSeries
    }
    
    func viewDidLoad() {
        ProgressHUD.show()
        Task {
            let result = await service.getTvSeriesOnAir()
            switch result {
            case .success(let tvSeries):
                self.tvSeries = tvSeries
                print(tvSeries.count)
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
        output?.onAirPresenterDidShow(tvSeries: tvSeries)
    }
}
