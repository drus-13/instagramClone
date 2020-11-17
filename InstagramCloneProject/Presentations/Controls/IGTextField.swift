//
//  IGTextField.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 17.11.2020.
//

import Foundation
import UIKit

final class IGTextField: UITextField {
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16))
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16))
    }
}

