//
//  Persistable.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 14/01/2023.
//

import Foundation

protocol Persistable {
    associatedtype T: Identifiable
    
    @discardableResult
    func save(_ object: T) async throws -> T
    
    func find(_ id: T.ID) async -> T?
    
    func findAll() async -> [T]
    
    @discardableResult
    func delete(_ id: T.ID) async throws -> T
}

extension Persistable {
    var eraseToAnyPersistable: AnyPersistable<T> {
        .init(base: self)
    }
}
