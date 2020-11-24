//
//  RegisterCountryListViewModelDelegate.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 21.11.2020.
//

import Foundation

protocol RegisterCountryListViewModelDelegate: class {
    
    func updateView(_ presenters: [RegisterCountryPresenter])
    func dismissViewController()
}
