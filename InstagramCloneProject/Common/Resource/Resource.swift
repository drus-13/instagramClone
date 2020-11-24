//
//  Resource.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 22.11.2020.
//

import Foundation

struct Resource {
    
    static func loadFromJson(_ fileName: String) -> String? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json"), let content = try? String(contentsOf: url) {
            return content
        }
        return nil
    }
}
