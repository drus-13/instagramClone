//
//  OnboardViewModel.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 12.11.2020.
//

import Foundation

final class OnboardViewModel {
    
    weak var delegate: OnboardViewModelDelegate?
    
    func load() {
        
    }
    
    func createNewAccountTapped() {
        
    }
    
    func signInTapped() {
        self.delegate?.navigateToLogin()
    }
}
