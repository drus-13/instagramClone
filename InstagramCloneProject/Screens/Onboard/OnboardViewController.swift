//
//  OnboardViewController.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 11.11.2020.
//

import UIKit

final class OnboardViewController: UIViewController {

    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var createNewAccountButton: UIButton!
    @IBOutlet private weak var signInButton: UIButton!
    
    private var viewModel: OnboardViewModel = OnboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
        self.viewModel.load()

        self.view.backgroundColor = Theme.with(color: .viewBackgroundColor)
        self.createNewAccountButton.configure(type: .primary)
        self.signInButton.configure(type: .secondary)
    }
    
    @IBAction private func createNewAccountButtonTapped(_ sender: Any) {
        self.viewModel.createNewAccountTapped()
    }
    
    @IBAction private func signInButtonTapped(_ sender: Any) {
        self.viewModel.signInTapped()
    }
}

extension OnboardViewController: OnboardViewModelDelegate {
    
    func navigateToLogin() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
