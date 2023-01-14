//
//  Location.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import Foundation

struct Location: Codable, Identifiable {
    let id: UUID
    let lat: Double
    let lon: Double
    let name: String
    
    static var `default`: Self {
        .init(id: .init(), lat: 0, lon: 0, name: "")
    }
}
