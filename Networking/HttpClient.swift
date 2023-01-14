//
//  HttpClient.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import Foundation

protocol HTTPClient {
    func fetch<T: Decodable>(request: URLRequest) async throws -> T
}
