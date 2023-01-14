//
//  UserDefaultPersistable.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import Foundation

struct UserDefaultPersistence<T: Identifiable & Codable>: Persistable {
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    func save(_ object: T) async throws -> T {
        fatalError()
    }
    
    func find(_ id: T.ID) async -> T? {
        fatalError()
    }
    
    func findAll() async -> [T] {
        fatalError()
    }
    
    func delete(_ id: T.ID) async -> T {
        fatalError()
    }
}

