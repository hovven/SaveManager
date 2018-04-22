//
//  SaveManager.swift
//
//  Created by Hossein Vesali Naseh on 4/15/18.
//  Copyright © 2018 Hoven. All rights reserved.
//
import Foundation
import UIKit

class SaveManager {
    
    
    // MARK: Singleton
    
    private static let instance = SaveManager()
    
    class func sharedInstance () -> SaveManager {
        return instance
    }
    
    
    // MARK: Manager
    func save<T:Encodable>(object: T, key: SaveManagerKeys) {
        do{
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(object)
            standard().set(encoded, forKey: key.rawValue)
        }catch{
        }
        sync()
    }
    
    func save<T:Encodable>(array: [T], key: SaveManagerKeys) {
        do{
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(array)
            standard().set(encoded, forKey: key.rawValue)
        }catch{
        }
        sync()
    }
    
    func save (object: AnyObject, key: SaveManagerKeys) {
        standard().set(object, forKey: key.rawValue)
        sync()
    }
    
    func get (key: SaveManagerKeys) -> AnyObject? {
        return standard().object(forKey: key.rawValue) as AnyObject
    }
    
    func get <T:Decodable> (key: SaveManagerKeys) -> T? {
        do{
            let jsonData : Data? = UserDefaults.standard.value(forKey: key.rawValue) as? Data
        
            if let data = jsonData {
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            } else {
                return nil
            }
        }catch{
            
        }
        return T.self as? T
    }
    
    func delete (key: SaveManagerKeys) {
        standard().removeObject(forKey: key.rawValue)
        sync()
    }
    
    
    func unarchive (key: SaveManagerKeys) -> AnyObject? {
        if let data = get(key: key) as? NSData {
            return NSKeyedUnarchiver.unarchiveObject(with: data as Data) as AnyObject
        } else {
            return nil
        }
    }
    
    func archive (object: AnyObject, key: SaveManagerKeys) {
        let data = NSKeyedArchiver.archivedData(withRootObject: object)
        save (object: data as AnyObject, key: key)
    }
    
    
    // MARK: Helpers
    
    func standard () -> UserDefaults {
        return UserDefaults.standard
    }
    
    func sync () {
        standard().synchronize()
    }
}

