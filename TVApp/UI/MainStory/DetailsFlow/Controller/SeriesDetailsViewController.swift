//
//  SeriesDetailsViewController.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 26.02.23.
//

import UIKit
import Kingfisher

private struct Settings {
    static let imageUrlPrefix = "https://image.tmdb.org/t/p/w500"
}

final class SeriesDetailsViewController: BaseViewController {
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    weak var output: SeriesDetailsViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        output?.viewDidTapBackButton()
    }
}
extension SeriesDetailsViewController: SeriesDetailsView {
    func setupView(with series: TvSeries) {
        descriptionLabel.text = series.overview
        titleLabel.text = series.tittle
        guard let imageURLString = series.wallPaper, let url = URL(string: Settings.imageUrlPrefix + imageURLString) else { return }
        posterImageView.kf.setImage(with: url)
    }
}
