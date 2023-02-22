//
//  TopRatedTvSeriesViewController.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import UIKit

final class TopRatedTvSeriesViewController: BaseViewController {
    
    weak var output: TopRatedTvSeriesViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TopRatedTvSeriesViewController: TopRatedTvSeriesView {
    
}
