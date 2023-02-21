//
//  TVError.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Foundation

enum TVError: Error {
    
    case unknown
    case connection
    case timeOut
    case parsingError(error: Swift.DecodingError)
    case serverError(message: String?)
    case custom(message: String)
    case requestCreation
    case httpResponse
    case uknownNetworkingError(endpoint: String)
    
    var errorDescription: String {
        switch self {
        case .unknown:
            return "Uknown Error"
        case .connection:
            return "Connection Error"
        case .timeOut:
            return "Connection time out"
        case .parsingError(error: let error):
            return parsingError(error: error)
        case .serverError(message: let message):
            return message ?? ""
        case .custom(message: let message):
            return message
        case .requestCreation:
            return "Request creation error"
        case .httpResponse:
            return "HTTP response error"
        case .uknownNetworkingError(endpoint: let endpoint):
            return "Error for: \(endpoint)"
        }
    }
    
    private func parsingError(error: Swift.DecodingError) -> String {
        let message = """
            
            🅰️ - Parsing Error - 🅰️
            Failure Reason: \(error.failureReason ?? "")
            Error Description: \(error.errorDescription ?? "")
            Localized Description: \(error.localizedDescription)
            Suggestion: \(error.recoverySuggestion ?? "")
            Overal body: \(error)
            🅰️ ------ End ------ 🅰️
            
            """
        return message
    }
}
