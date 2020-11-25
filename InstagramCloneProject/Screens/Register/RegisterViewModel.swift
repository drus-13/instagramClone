//
//  RegisterViewModel.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 20.11.2020.
//

import Foundation

final class RegisterViewModel {
    
    weak var delegate: RegisterViewModelDelegate?
    private var countries: [CountryModel] = []
    
    func load() {
        
    }
    
    func phoneCountryCodeTapped() {
        if let fileContent = Resource.loadFromJson("CountryList"),
           let model = Mapper.parseJson(model: CountryListResponseModel.self, content: fileContent) {
            let presenters = (model.countries ?? []).map { RegisterCountryPresenter(countryName: $0.country ?? "", phoneCode: $0.phoneCode ?? "")}
            self.countries = model.countries ?? []
            let viewModel: RegisterCountryListViewModel = RegisterCountryListViewModel(presenters: presenters)
            viewModel.viewModelDelegate = self
            self.delegate?.navigationToCountryList(viewModel: viewModel)
        }
    }
    
    func nextButtonTapped() {
        self.delegate?.navigateToNameStep()
    }
}

extension RegisterViewModel: RegisterCountryListDelegate {
    
    func didSelectRow(at index: Int) {
        let country = self.countries[index]
        self.delegate?.updateCountryButton("\(country.countryCode ?? "") \(country.phoneCode ?? "")")
    }
    
}
