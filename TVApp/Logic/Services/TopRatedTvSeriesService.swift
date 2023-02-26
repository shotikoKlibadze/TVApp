//
//  TopRatedTvSeriesService.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import Foundation

protocol TopRatedTvSeriesService {
    func getTopRatedTvSeries() async -> Result<[TvSeries], Error>
}

///Could have LocalDataRepository fetching from CoreData etc...
final class TopRatedTvSeriesRemoteDataRepository: TopRatedTvSeriesService {
   
    private let networkClient: Network.Client
   
    init() {
        self.networkClient = Network.Client()
    }
    
    func getTopRatedTvSeries() async -> Result<[TvSeries], Error> {
        let endpoint = TopRatedTvSeriesEndpoint<TvSeriesResponse>.getTopRatedTvSeries
        let result = await networkClient.makeRequest(with: endpoint)
        switch result {
        case .success(let response):
            let data = response.results
            let tvSeries = data.map({TvSeries(with: $0)})
            return.success(tvSeries)
        case .failure(let error):
            return .failure(error)
        }
    }
}
