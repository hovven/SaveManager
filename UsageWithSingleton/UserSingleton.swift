//
//  UserSingleton.swift
//
//  Created by Hossein Vesali Naseh on 4/9/18.
//  Copyright © 2018 Hoven. All rights reserved.
//

import UIKit

class UserSingleton {
    
    let user : User
    
    struct Static
    {
        static var instance: UserSingleton?
    }
    
    class var sharedInstance: UserSingleton
    {
        if Static.instance == nil
        {
            Static.instance = UserSingleton()
        }
        
        return Static.instance!
    }
    
    private init () {
        user = SaveManager.sharedInstance().get(key: SaveManagerKeys.user)!
    }
    
    func dispose()
    {
        UserSingleton.Static.instance = nil
    }
}


