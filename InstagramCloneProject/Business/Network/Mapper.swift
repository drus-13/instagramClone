//
//  Mapper.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 22.11.2020.
//

import Foundation
import UIKit

struct Mapper {
    
    static func parseJson<T: Decodable>(model: T.Type, content: String) -> T? {
        let decoder = JSONDecoder()
        if let json = try? decoder.decode(model, from: Data(content.utf8)) {
            return json
        }
        return nil
    }
}
