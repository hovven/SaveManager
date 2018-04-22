//
//  UserSingleton.swift
//
//  Created by Hossein Vesali Naseh on 4/9/18.
//  Copyright © 2018 Hoven. All rights reserved.
//

import UIKit

class UserSingleton {
    
    let user : User
    
    private static var sharedInstance : UserSingleton?
    
    final class func shared() -> UserSingleton {
        guard let instance = sharedInstance else {
            sharedInstance = UserSingleton()
            return sharedInstance!
        }
        return instance
    }
    
    private init () {
        user = SaveManager.sharedInstance().get(key: SaveManagerKeys.user)!
    }
    
    func resetSharedInstance() {
        UserSingleton.sharedInstance = nil
    }
}


