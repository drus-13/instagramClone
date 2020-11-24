//
//  RegisterViewModelDelegate.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 20.11.2020.
//

import Foundation

protocol RegisterViewModelDelegate: class {
    
    func navigationToCountryList(viewModel: RegisterCountryListViewModel)
    func updateCountryButton(_ text: String)
}
