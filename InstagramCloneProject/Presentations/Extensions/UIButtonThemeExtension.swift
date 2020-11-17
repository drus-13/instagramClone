//
//  UIButtonThemeExtension.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 12.11.2020.
//

import Foundation
import UIKit

enum ThemeButtonType {
    case primary
    case secondary
    case inline
}

extension UIButton {
    
    func configure(type: ThemeButtonType) {
        switch type {
        case .primary:
            self.backgroundColor = Theme.with(color: .primaryColor)
            self.setTitleColor(Theme.with(color: .primaryTextColor), for: .normal)
            self.titleLabel?.font = Font.with(size: .body, weight: .semibold, family: .text)
            self.layer.masksToBounds = true
            self.layer.cornerRadius = 4
            self.contentEdgeInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        case .secondary:
            self.backgroundColor = Theme.with(color: .clearColor)
            self.setTitleColor(Theme.with(color: .primaryColor), for: .normal)
            self.titleLabel?.font = Font.with(size: .body, weight: .semibold, family: .text)
            self.contentEdgeInsets = UIEdgeInsets(top: 0.01, left: 0, bottom: 0.01, right: 0)
        case .inline:
            self.backgroundColor = Theme.with(color: .clearColor)
            self.setTitleColor(Theme.with(color: .primaryColor), for: .normal)
            self.titleLabel?.font = Font.with(size: .body, weight: .semibold, family: .text)
            self.contentEdgeInsets = UIEdgeInsets(top: 0.01, left: 0, bottom: 0.01, right: 0)
        }
    }
}
