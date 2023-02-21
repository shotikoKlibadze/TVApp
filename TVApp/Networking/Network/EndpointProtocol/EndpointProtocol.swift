//
//  EndpointProtocol.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Foundation

protocol Endpoint {
    associatedtype Response
    
    var requestMethod: Network.RequestMethod { get }
    var path: String { get }
    var headerParameters: [String: Any]? { get }
    var quaryParameters: [String: Any]? { get }
}
