//
//  OnAirTvSeriesViewController.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import UIKit

final class OnAirTvSeriesViewController: BaseViewController {
    
    weak var output: OnAirTvSeriesViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension OnAirTvSeriesViewController: OnAirTvSeriesView {
    
}
