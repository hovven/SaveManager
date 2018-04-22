//
//  UserLogin.swift
//
//  Created by Hossein Vesali Naseh on 4/9/18.
//  Copyright © 2018 Hoven. All rights reserved.
//

import Foundation

struct User : Codable {
    let id : Int?
    let phone : String?
    let fullName : String?
    let imagePath : String?
    let status : Int?
    let accessToken : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case phone = "phone"
        case fullName = "fullName"
        case imagePath = "imagePath"
        case status = "status"
        case accessToken = "accessToken"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        imagePath = try values.decodeIfPresent(String.self, forKey: .imagePath)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
    }
}
