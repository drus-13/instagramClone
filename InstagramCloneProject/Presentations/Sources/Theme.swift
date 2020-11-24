//
//  Theme.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 12.11.2020.
//

import Foundation
import UIKit

// Theme singleton structure
struct Theme {
    
    enum Color {
        case bodyTextColor
        case borderColor
        case clearColor
        case primaryColor
        case primaryTextColor
        case placeholderColor
        case viewBackgroundColor
        case navigationColor
        case secondaryTextColor
        case separatorColor
    }
    
    static func with(color: Color) -> UIColor {
        switch color {
        case .bodyTextColor:
            return .black
        case .borderColor:
            return UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1)
        case .clearColor:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        case .primaryColor:
            return UIColor(red: 65/255, green: 146/255, blue: 238/255, alpha: 1)
        case .primaryTextColor:
            return .white
        case .placeholderColor:
            return UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1)
        case .viewBackgroundColor:
            return UIColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1)
        case .navigationColor:
            return UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1)
        case .secondaryTextColor:
            return UIColor(red: 143/255, green: 143/255, blue: 143/255, alpha: 1)
        case .separatorColor:
            return UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
        }
    }
}
