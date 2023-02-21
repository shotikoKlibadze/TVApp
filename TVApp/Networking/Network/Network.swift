//
//  Network.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Foundation

struct Network {
    
    enum ResponseStatus: Int {
        case success = 200
    }
    
    enum RequestMethod: String {
        case get    = "GET"
        case post   = "POST"
        case delete = "DELETE"
        case put    = "PUT"
    }
}
