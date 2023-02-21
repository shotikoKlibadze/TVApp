//
//  OnAirTvSeriesEndpoint.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Foundation

import Foundation

enum OnAirTvSeriesEndpoint<R> {
    typealias Response = R
    
    case getOnAirTvSeries
}

extension OnAirTvSeriesEndpoint: Endpoint {
   
    var requestMethod: Network.RequestMethod {
        switch self {
        case .getOnAirTvSeries:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getOnAirTvSeries:
            return "on_the_air"
        }
    }
    
    var headerParameters: [String : Any]? {
        var params = [String : String]()
        switch self {
        case .getOnAirTvSeries:
            //Add headers to endpoint
            break
        }
        return params
    }
    
    var quaryParameters: [String : Any]? {
        var params = [String : String]()
        switch self {
        case .getOnAirTvSeries:
            //Add quary parameters to endpoint
            break
        }
        return params
    }
}
