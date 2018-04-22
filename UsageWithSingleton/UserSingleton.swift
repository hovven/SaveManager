//
//  UserSingleton.swift
//
//  Created by Hossein Vesali Naseh on 4/9/18.
//  Copyright © 2018 Hoven. All rights reserved.
//

import UIKit

class UserSingleton {
    
    let user : User
    
    static let sharedInstance = UserSingleton()
    
    private init () {
        user = SaveManager.sharedInstance().get(key: SaveManagerKeys.user)
    }
    
}

