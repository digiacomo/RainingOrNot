//
//  ForecastRepo.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import Foundation

struct ForecastRepo {
    private let persistence: AnyPersistable<Forecast>
    private let apiClient: APIClient
    
    init(persistence: AnyPersistable<Forecast>, apiClient: APIClient) {
        self.persistence = persistence
        self.apiClient = apiClient
    }
    
    func fetch(location: Location) async throws -> Forecast? {
        do {
            let forecast = try await apiClient.oneCall(lat: location.lat, lon: location.lon)
            try await persistence.save(forecast)
            return forecast
        } catch is URLError {
            return await persistence.find(location.id)
        } catch {
            return nil
        }
    }
    
    func save<T>(_ object: T) async throws -> T {
        fatalError()
    }
}
