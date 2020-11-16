//
//  Localization.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 12.11.2020.
//

import Foundation

struct Localization {
    
    static func string(key: String, defaultValues: String) -> String {
        return NSLocalizedString(key, comment: defaultValues)
    }
}
