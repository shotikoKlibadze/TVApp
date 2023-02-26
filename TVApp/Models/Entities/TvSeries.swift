//
//  TvSeries.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 26.02.23.
//

import Foundation

struct TvSeries {
    
    let poster : String?
    let wallPaper : String?
    let tittle : String
    let overview : String
    
    init(with data: TvSeriesData) {
        self.poster = data.posterPath
        self.wallPaper = data.backdropPath
        self.tittle = data.name
        self.overview = data.overview
    }
}
