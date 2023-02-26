//
//  TvSeriesTableViewCell.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 26.02.23.
//

import UIKit
import Kingfisher

private struct Settings {
    static let imageUrlPrefix = "https://image.tmdb.org/t/p/w500"
}

final class TvSeriesTableViewCell: UITableViewCell {
    
    static let height: CGFloat = 200
    static let identifier = "TvSeriesTableViewCell"
    static let nibName = "TvSeriesTableViewCell"
    
    @IBOutlet weak var posteImageView: UIImageView!
    
    func configure(with tvSeries: TvSeries) {
        guard let urlString = tvSeries.wallPaper, let url = URL(string: Settings.imageUrlPrefix +  urlString) else { return }
        posteImageView.kf.setImage(with: url)
    }
}
