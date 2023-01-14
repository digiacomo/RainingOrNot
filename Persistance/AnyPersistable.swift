//
//  AnyPersistable.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import Foundation

// type erasure for Persistable
struct AnyPersistable<T: Identifiable>: Persistable {
    private var _save: (T) async throws -> T
    private var _find: (T.ID) async -> T?
    private var _findAll: () async -> [T]
    private var _delete: (T.ID) async throws -> T
    
    init<P: Persistable>(base: P) where P.T == T {
        self._save = base.save
        self._find = base.find
        self._findAll = base.findAll
        self._delete = base.delete
    }
    
    func find(_ id: T.ID) async -> T? {
        await self._find(id)
    }
    
    func findAll() async -> [T] {
        await self._findAll()
    }
    
    @discardableResult
    func save(_ object: T) async throws -> T {
        try await self._save(object)
    }
    
    @discardableResult
    func delete(_ id: T.ID) async throws -> T {
        try await self._delete(id)
    }
}
