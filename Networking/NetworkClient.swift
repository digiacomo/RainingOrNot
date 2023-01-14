//
//  NetworkClient.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import Foundation

struct NetworkClient: HTTPClient {
    private let urlSession: URLSession
    private let decoder = JSONDecoder()
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func fetch<T>(request: URLRequest) async throws -> T where T : Decodable {
        let (data, _) = try await urlSession.data(for: request)
        return try decoder.decode(T.self, from: data)
    }
}
