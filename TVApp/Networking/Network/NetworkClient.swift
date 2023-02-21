//
//  NetworkClient.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Foundation

extension Network {
    
    final class Client {
        
        private let session: URLSession
        init() {
            let config = URLSessionConfiguration.default
            session = URLSession(configuration: config)
        }
    }
}

extension Network.Client {
    
    func makeRequest<T, E>(with endpoint: E, isAuthorized: Bool = true) async -> Result<T,TVError>
    where T : Codable, E: Endpoint, T == E.Response {
        
        guard let url = makeURLwith(endpoint: endpoint),
                let request = configureRequest(url: url,
                                               endpoint: endpoint) else { return .failure(.requestCreation) }
        let jsonDecoder = JSONDecoder()
        var model: T!
        
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return.failure(.httpResponse)
            }
            guard httpResponse.statusCode == Network.ResponseStatus.success.rawValue else {
                let error = handeStatusCodeError(urlResponse: response)
                return .failure(error)
            }
            
            let dataModel = try jsonDecoder.decode(T.self, from: data)
            model = dataModel
        } catch let error as URLError {
            let error = handeURLError(error: error)
            print(error)
            return .failure(error)
        } catch let error as Swift.DecodingError {
            let error = TVError.parsingError(error: error)
            print(error)
            return .failure(error)
        } catch {
            let error = TVError.uknownNetworkingError(endpoint: endpoint.path)
            print(error)
            return .failure(error)
        }
        return .success(model)
    }
}

private extension Network.Client {
    
    func makeURLwith(endpoint: any Endpoint) -> URL? {
        let urlString = "https://api.themoviedb.org/3/tv/\(endpoint.path)?api_key=f4fc52063b2419f14cdaa0ac0fd23462&language=en-US&page=1"
        guard var urlComponets = URLComponents(string: urlString) else { return nil }
        var urlQueryItems = [URLQueryItem]()
        endpoint.quaryParameters?.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
        }
        urlComponets.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil
        return urlComponets.url
    }
    
    func configureRequest(url: URL, endpoint: any Endpoint) -> URLRequest? {
        var request = URLRequest(url: url)
        
        if let headerParameters = endpoint.headerParameters {
            guard let jsonData = try? JSONSerialization.data(withJSONObject: headerParameters, options: [.sortedKeys])  else {
                //TODO: Handle error
                return nil
            }
            request.httpBody = jsonData
        }
        request.httpMethod = endpoint.requestMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        print(request)
        return request
    }
    
    func handeStatusCodeError(urlResponse: URLResponse) -> TVError {
        guard let httpResponse  = urlResponse as? HTTPURLResponse else {
            return .unknown }
        return .serverError(message: httpResponse.debugDescription)
    }
    
    func handeURLError(error: URLError) -> TVError {
        if isNetworkConnectionError(error) {
            return .connection
        } else if error.code == URLError.Code.timedOut {
            return .timeOut
        } else {
            return .serverError(message: error.localizedDescription)
        }
    }
    
    func isNetworkConnectionError(_ error: URLError) -> Bool {
        switch error.code {
        case .notConnectedToInternet,
             .networkConnectionLost,
             .cannotLoadFromNetwork,
             .dataNotAllowed:
            return true
        default:
            return false
        }
    }
}
