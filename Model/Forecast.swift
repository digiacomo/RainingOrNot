//
//  Forecast.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import Foundation

struct Forecast: Codable, Identifiable {
    let id: UUID
    let locationId: Location.ID
    let current: Current
    let hourly: [Hourly]
    let minutely: [Minutely]
    
    static var `default`: Self {
        .init(id: .init(), locationId: .init(), current: .init(), hourly: .init(), minutely: .init())
    }
}

extension Forecast {
    struct Hourly: Codable {
        
    }
    
    struct Minutely: Codable {
        
    }
    
    struct Current: Codable {
        
    }
}


