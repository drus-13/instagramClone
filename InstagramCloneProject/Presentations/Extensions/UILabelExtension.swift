//
//  UILabelExtension.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 15.11.2020.
//

import Foundation
import UIKit

extension UILabel {
    
    @IBInspectable
    var localizableKey: String {
        get {
            return ""
        }
        set {
            self.text = Localization.string(key: newValue, defaultValues: "")
        }
    }
    
}
