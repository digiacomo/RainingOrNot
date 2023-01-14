//
//  ApiClient.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import Foundation

struct APIClient {
    private let client: HTTPClient
    private let baseURL: URL
    
    init(client: HTTPClient, baseURL: URL) {
        self.client = client
        self.baseURL = baseURL
    }
    
    func oneCall(lat: Double, lon: Double) async throws -> Forecast {
        let baseUrl = baseURL.appendingPathComponent("onecall")
        let queryItems : [URLQueryItem] = [
            .init(name: "lat", value: String(lat)),
            .init(name: "lon", value: String(lon))
        ]
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems
        
        guard let url = components?.url else {
            throw APIError.wrongEndpoint
        }
        let request = URLRequest(url: url)
        return try await client.fetch(request: request)
    }
    
    enum Exclude: String {
        case current,
        minutely,
        hourly,
        daily,
        alerts
    }
    
    enum APIError: Error {
        case wrongEndpoint
    }
}
