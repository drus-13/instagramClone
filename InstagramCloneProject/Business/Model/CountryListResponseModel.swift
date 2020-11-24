//
//  CountryListResponseModel.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 22.11.2020.
//

import Foundation

struct CountryListResponseModel: Decodable {
    var countries: [CountryModel]?
}
