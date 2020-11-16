//
//  UIButtonExtension.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 12.11.2020.
//

import Foundation
import UIKit

extension UIButton {
    
    @IBInspectable
    var localizableKey: String {
        get {
            return ""
        }
        set {
            self.setTitle(Localization.string(key: newValue, defaultValues: ""), for: .normal)
        }
    }
    
}
