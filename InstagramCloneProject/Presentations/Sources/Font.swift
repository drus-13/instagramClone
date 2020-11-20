//
//  Font.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 11.11.2020.
//

import Foundation
import UIKit


// Font singleton structure
struct Font {
    
    enum Family {
        case compactDisplay
        case display
        case text
    }
    
    enum Weight {
        case regular
        case medium
        case semibold
        case light
    }
    
    enum Size: CGFloat {
        case small = 12
        case body = 14
        case subtitle = 18
        case title = 24
    }
    
    static func with(size: Size, weight: Weight, family: Family) -> UIFont {
        var fontName = ""
        switch family {
        case .compactDisplay:
            fontName = "SFCompactDisplay"
        case .display:
            fontName = "SFProDisplay"
        case .text:
            fontName = "SFProText"
        }
        
        switch weight {
        case .regular:
            fontName += "-Regular"
        case .medium:
            fontName += "-Medium"
        case .semibold:
            fontName += "-Semibold"
        case .light:
            fontName += "-Light"
        }
        
        return UIFont(name: fontName, size: size.rawValue)!
    }
}
