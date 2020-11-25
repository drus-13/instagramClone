//
//  LoginViewController.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 15.11.2020.
//

import UIKit

final class LoginViewController: UIViewController {

    private var viewModel: LoginViewModel = LoginViewModel()
    
    @IBOutlet private weak var usernameTextField: IGTextField!
    @IBOutlet private weak var passwordTextField: IGTextField!
    @IBOutlet private weak var forgetPasswordButton: UIButton!
    @IBOutlet private weak var logInButton: UIButton!
    @IBOutlet private weak var orDividerView: UIView!
    @IBOutlet private weak var orLabel: UILabel!
    @IBOutlet private weak var logInWithFacebookButton: UIButton!
    @IBOutlet private weak var bottomInfoView: AuthenticationBottomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
        self.viewModel.load()
        
        self.usernameTextField.setPlaceholder(Localization.string(key: "login.userNamePlaceholder", defaultValues: ""))
        self.passwordTextField.setPlaceholder(Localization.string(key: "login.passwordPlaceholder", defaultValues: ""))
              
        prepareUI()
    }
    
    private func prepareUI() {
        self.view.backgroundColor = Theme.with(color: .viewBackgroundColor)
        self.usernameTextField.configure()
        self.passwordTextField.configure()
        self.forgetPasswordButton.configure(type: .inline)
        self.forgetPasswordButton.titleLabel?.font = Font.with(size: .small, weight: .semibold, family: .display)
        self.logInButton.configure(type: .primary)
        self.orLabel.textColor = Theme.with(color: .placeholderColor)
        self.orLabel.font = Font.with(size: .small, weight: .semibold, family: .display)
        self.orLabel.backgroundColor = Theme.with(color: .viewBackgroundColor)
        self.orDividerView.backgroundColor = Theme.with(color: .borderColor)
        self.logInWithFacebookButton.configure(type: .secondary)
        
        self.bottomInfoView.configure(infoText: Localization.string(key: "login.dontHaveAnAccount", defaultValues: ""), infoButtonText: Localization.string(key: "login.signUp", defaultValues: ""))
        self.bottomInfoView.delegate = self
    }
    
    @IBAction private func forgetPasswordButtonTapped(_ sender: Any) {
        self.viewModel.forgetPasswordTapped()
    }
    
    @IBAction private func logInButtonTapped(_ sender: Any) {
        self.viewModel.logInTapped()
    }
    
    @IBAction private func logInFacebookButtonTapped(_ sender: Any) {
        self.viewModel.loginWithFacebookTapped()
    }
    
}

extension LoginViewController: LoginViewModelDelegate {
    
}

extension LoginViewController: AuthenticationBottomViewDelegate {
    func viewButtonTapped() {
        self.viewModel.signUpTapped()

    }
    
    
}
