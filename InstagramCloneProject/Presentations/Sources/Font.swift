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
        case text
    }
    
    enum Weight {
        case semibold
    }
    
    enum Size: CGFloat {
        case body = 14
    }
    
    static func with(size: Size, weight: Weight, family: Family) -> UIFont {
        var fontName = ""
        switch family {
        case .text:
            fontName = "SFProText"
        }
        
        switch weight {
        case .semibold:
            fontName += "-Semibold"
        }
        
        return UIFont(name: fontName, size: size.rawValue)!
    }
}
