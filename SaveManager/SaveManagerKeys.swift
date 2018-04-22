//
//  SaveManagerKeys.swift
//
//  Created by Hossein Vesali Naseh on 4/15/18.
//  Copyright © 2018 Hoven. All rights reserved.
//

import Foundation

enum SaveManagerKeys: String {
    
    case user
    case config
    case status
    case dToken
    
    var rawValue: String {
        switch self {
        case .user : return "user"
        case .config : return "config"
        case .status : return "status"
        case .dToken : return "d_token"
        }
    }
}
