//
//  APICaller.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 8/3/22.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let key = API.sec.APIKey
        static let baseUrl = "https://imdb-api.com/en/API/"
    }
    
    private init() {}
    
    // MARK: - Public
    
    public func search(
        query: String,
        completion: @escaping (Result<SearchResponse, Error>) -> Void
    ) {
        request(
            url: url(
                for: .search, queryParams: [API.sec.APIKey: query]), expecting: SearchResponse.self, completion: completion
        )
//        guard let url = url(
//            for: .search,
//            queryParams: [API.sec.APIKey:query]
//        ) else {
//            return
//        }
        
    }
    
    // MARK: - Private
    
    private enum Endpoint: String {
        case search
    }
    
    private enum APIError: Error {
        case noDataReturned
        case invalidUrl
    }
    
    private func url(
        for endpoint: Endpoint,
        queryParams: [String: String] = [:]
    ) -> URL? {
        var urlString = Constants.baseUrl + endpoint.rawValue + "/"
        
        var queryItems = [URLQueryItem]()
        
        
        
        for (name, value) in queryParams {
            queryItems.append(.init(name: name, value: value))
        }
        
        urlString += queryItems.map {"\($0.name)/\($0.value ?? "")"}.joined(separator: "")
        
        print("\n\(urlString)\n")
        return URL(string: urlString)
    }
    
    private func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = url else {
            // invalid url
            completion(.failure(APIError.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturned))
                }
                return
        }
        
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
}
