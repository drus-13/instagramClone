//
//  UITextFieldThemeExtension.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 16.11.2020.
//

import Foundation
import UIKit

extension UITextField {
    
    func configure() {
        self.layer.borderColor = Theme.with(color: .borderColor).cgColor
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.textColor = Theme.with(color: .primaryTextColor)
        self.borderStyle = .roundedRect
    }
    
    func setPlaceholder(_ placeholderText: String) {
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : Theme.with(color: .placeholderColor)])
    }
}
