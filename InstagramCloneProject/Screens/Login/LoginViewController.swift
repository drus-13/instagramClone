//
//  LoginViewController.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 15.11.2020.
//

import UIKit

final class LoginViewController: UIViewController {

    private var loginViewModel: LoginViewModel = LoginViewModel()
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var forgetPasswordButton: UIButton!
    @IBOutlet private weak var logInButton: UIButton!
    @IBOutlet private weak var orDividerView: UIView!
    @IBOutlet private weak var orLabel: UILabel!
    @IBOutlet private weak var logInWithFacebookButton: UIButton!
    @IBOutlet private weak var bottomDivider: UIView!
    @IBOutlet private weak var bottomInfoLabel: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginViewModel.delegate = self
        self.loginViewModel.load()
        
        self.usernameTextField.text = Localization.string(key: "login.userNamePlaceholder", defaultValues: "")
        self.passwordTextField.text = Localization.string(key: "login.passwordPlaceholder", defaultValues: "")
                
        self.view.backgroundColor = Theme.with(color: .viewBackgroundColor)
        self.usernameTextField.configure()
        self.passwordTextField.configure()
        self.forgetPasswordButton.configure(type: .secondarySmall)
        self.logInButton.configure(type: .primary)
        self.orLabel.textColor = Theme.with(color: .placeholderColor)
        self.orDividerView.backgroundColor = Theme.with(color: .borderColor)
        self.logInWithFacebookButton.configure(type: .secondary)
        self.bottomDivider.backgroundColor = Theme.with(color: .borderColor)
        self.bottomInfoLabel.textColor = Theme.with(color: .placeholderColor)
        self.signUpButton.configure(type: .inline)
    }
    
    @IBAction private func forgetPasswordButtonTapped(_ sender: Any) {
    }
    
    @IBAction private func logInButtonTapped(_ sender: Any) {
    }
    
    @IBAction private func logInFacebookButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction private func signUpButtonTapped(_ sender: Any) {
    }
    
}

extension LoginViewController: LoginViewModelDelegate {
    
}
