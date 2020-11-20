//
//  OnboardViewModelDelegate.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 12.11.2020.
//

import Foundation

protocol OnboardViewModelDelegate: class {
    
    func navigateToLogin()
    func navigateToRegister()
}
