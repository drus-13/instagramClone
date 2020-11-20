//
//  RegisterPhoneTextField.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 20.11.2020.
//

import Foundation
import UIKit

class RegisterPhoneTextField: IGTextField {
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 12, left: 104, bottom: 12, right: 16))
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 12, left: 104, bottom: 12, right: 16))
    }
}
