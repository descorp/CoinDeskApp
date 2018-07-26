//
//  CacheProvider.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 26/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

protocol HasCacheStorage {
    var cache: CacheStorage { get }
}

protocol CacheStorage {
    
    /// Save object to store. _O(1)_
    ///
    /// - Parameter object: object to save.
    /// - Throws: JSON encoding error.
    func save<T: Codable>(_ object: T, key: String) throws
    
    /// Save optional object (if not nil) to store. _O(n)_
    ///
    /// - Parameter optionalObject: optional object to save.
    /// - Throws: JSON encoding error.
    func save<T: Codable>(_ optionalObject: T?, key: String) throws
    
    /// Save array of objects to store. _O(n)_
    ///
    /// - Parameter objects: object to save.
    /// - Throws: JSON encoding error.
    func save<T: Codable>(_ objects: [T], key: String) throws
    
    /// Get object from store by its id. _O(1)_
    ///
    /// - Parameter id: object id.
    /// - Returns: optional object.
    func object<T: Codable>(withId id: String) -> T?
    
    /// Delete all objects in store. _O(1)_
    func deleteAll()
}

class CacheStorageService: CacheStorage {
    
    func save<T>(_ object: T, key: String) throws where T : Decodable, T : Encodable {
        
    }
    
    func save<T>(_ optionalObject: T?, key: String) throws where T : Decodable, T : Encodable {
        
    }
    
    func save<T>(_ objects: [T], key: String) throws where T : Decodable, T : Encodable {
        
    }
    
    func object<T>(withId id: String) -> T? where T : Decodable, T : Encodable {
        return nil
    }
    
    func deleteAll() {
        
    }
}
