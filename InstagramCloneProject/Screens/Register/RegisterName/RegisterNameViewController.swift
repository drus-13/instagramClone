//
//  RegisterNameViewController.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 25.11.2020.
//

import UIKit

final class RegisterNameViewController: UIViewController {
    
    @IBOutlet private weak var registerInputView: RegisterInputView!
    
    private let viewModel: RegisterNameViewModel = RegisterNameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.delegate = self
        self.viewModel.load()
        
        self.registerInputView.delegate = self
        self.prepareUI()
    }
    
    private func prepareUI() {
        self.registerInputView.configure(title: Localization.string(key: "register.name.title", defaultValues: ""),
                                         subtitle: Localization.string(key: "register.name.subtitle", defaultValues: ""),
                                         textFieldPlaceholder: Localization.string(key: "register.name.textFieldPlaceholder", defaultValues: ""),
                                         buttonTitle: Localization.string(key: "next", defaultValues: ""),
                                         bottomInfo: Localization.string(key: "register.bottomInfo", defaultValues: ""),
                                         bottomInfoButtonTitle: Localization.string(key: "register.bottomInfoSignIn", defaultValues: ""))
    }

}

extension RegisterNameViewController: RegisterNameViewModelDelegate {
    
}

extension RegisterNameViewController: RegisterInputViewDelegate {
    func bottomButtonTapped() {
        
    }
    
    func buttonTapped() {
        
    }
    
    
}
