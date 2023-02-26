//
//  TopRatedTvSeriesEndpoint.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 26.02.23.
//

import Foundation

enum TopRatedTvSeriesEndpoint<R> {
    typealias Response = R
    
    case getTopRatedTvSeries
}

extension TopRatedTvSeriesEndpoint: Endpoint {
   
    var requestMethod: Network.RequestMethod {
        switch self {
        case .getTopRatedTvSeries:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getTopRatedTvSeries:
            return "top_rated"
        }
    }
    
    var headerParameters: [String : Any]? {
        var params = [String : String]()
        switch self {
        case .getTopRatedTvSeries:
            //Add headers to endpoint
            break
        }
        return params
    }
    
    var quaryParameters: [String : Any]? {
        var params = [String : String]()
        switch self {
        case .getTopRatedTvSeries:
            //Add quary parameters to endpoint
            break
        }
        return params
    }
}
