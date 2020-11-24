//
//  CountryModel.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 22.11.2020.
//

import Foundation

struct CountryModel: Decodable {
    var country: String?
    var phoneCode: String?
    var countryCode: String?
    

    
    enum CodingKeys: String, CodingKey {
        case country = "name"
        case phoneCode = "dial_code"
        case countryCode = "code"
        
    }
    
}
