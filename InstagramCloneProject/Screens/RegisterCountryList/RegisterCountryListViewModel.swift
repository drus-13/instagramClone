//
//  RegisterCountryListViewModel.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 21.11.2020.
//

import Foundation

final class RegisterCountryListViewModel {
    
    weak var delegate: RegisterCountryListViewModelDelegate?
    weak var viewModelDelegate: RegisterCountryListDelegate?
    
    private var presenters: [RegisterCountryPresenter] = []
    
    init(presenters: [RegisterCountryPresenter]) {
        self.presenters = presenters
    }
    
    func load() {
        self.delegate?.updateView(presenters)
    }
    
    func didSelectRow(at index: Int) {
        self.viewModelDelegate?.didSelectRow(at: index)
        self.delegate?.dismissViewController()
    }
}
