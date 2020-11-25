//
//  RegisterViewController.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 20.11.2020.
//

import Foundation
import UIKit

final class RegisterViewController: UIViewController {
    
    private enum SegmentType {
        case phone
        case email
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var phoneSegmentButton: UIButton!
    @IBOutlet private weak var emailSegmentButton: UIButton!
    @IBOutlet private weak var segmentDividerView: UIView!
    @IBOutlet private weak var phoneSegmentDivider: UIView!
    @IBOutlet private weak var emailSegmentDivider: UIView!
    @IBOutlet private weak var phoneTextFieldContentView: UIView!
    @IBOutlet private weak var phoneTextField: RegisterPhoneTextField!
    @IBOutlet private weak var emailTextField: IGTextField!
    @IBOutlet private weak var phoneCountryCodeButton: UIButton!
    @IBOutlet private weak var phoneCountryCodeDivider: UIView!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var phoneInfoLabel: UILabel!
    @IBOutlet private weak var bottomDivider: UIView!
    @IBOutlet private weak var bottomInfoLabel: UILabel!
    @IBOutlet private weak var bottomInfoButton: UIButton!
    @IBOutlet private weak var bottomInfoView: AuthenticationBottomView!

    
    private let viewModel: RegisterViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
        self.viewModel.load()
        
        self.phoneTextField.setPlaceholder(Localization.string(key: "register.phonePlaceholder", defaultValues: ""))
        self.emailTextField.setPlaceholder(Localization.string(key: "register.emailPlaceholder", defaultValues: ""))
        self.phoneTextField.keyboardType = .phonePad
        self.emailTextField.keyboardType = .emailAddress

        self.prepareUI()
        self.configureSegment(.phone)
    }
    
    private func prepareUI() {
        self.view.backgroundColor = Theme.with(color: .viewBackgroundColor)
        
        self.titleLabel.textColor = Theme.with(color: .navigationColor)
        self.titleLabel.font = Font.with(size: .title, weight: .light, family: .text)
        
        // Phone button
        self.phoneSegmentButton.backgroundColor = Theme.with(color: .clearColor)
        self.phoneSegmentButton.tintColor = Theme.with(color: .clearColor)
        self.phoneSegmentButton.setTitleColor(Theme.with(color: .secondaryTextColor), for: .normal)
        self.phoneSegmentButton.setTitleColor(Theme.with(color: .bodyTextColor), for: .selected)
        self.phoneSegmentButton.titleLabel?.font = Font.with(size: .subtitle, weight: .semibold, family: .text)
        self.phoneSegmentButton.contentEdgeInsets = UIEdgeInsets(top: 0.01, left: 0, bottom: 0.01, right: 0)
        
        // Email button
        self.emailSegmentButton.backgroundColor = Theme.with(color: .clearColor)
        self.emailSegmentButton.tintColor = Theme.with(color: .clearColor)
        self.emailSegmentButton.setBackgroundImage(nil, for: .normal)
        self.emailSegmentButton.setTitleColor(Theme.with(color: .secondaryTextColor), for: .normal)
        self.emailSegmentButton.setTitleColor(Theme.with(color: .bodyTextColor), for: .selected)
        self.emailSegmentButton.titleLabel?.font = Font.with(size: .subtitle, weight: .semibold, family: .text)
        self.emailSegmentButton.contentEdgeInsets = UIEdgeInsets(top: 0.01, left: 0, bottom: 0.01, right: 0)
        
        // Divider
        self.segmentDividerView.backgroundColor = Theme.with(color: .secondaryTextColor)
        self.emailSegmentDivider.backgroundColor = Theme.with(color: .secondaryTextColor)
        self.phoneSegmentDivider.backgroundColor = Theme.with(color: .bodyTextColor)
        self.emailSegmentDivider.backgroundColor = Theme.with(color: .bodyTextColor)


        
        // Inputs
        self.phoneTextField.configure()
        self.phoneCountryCodeButton.configure(type: .secondary)
        self.phoneCountryCodeButton.titleLabel?.font = Font.with(size: .body, weight: .regular, family: .text)
        self.emailTextField.configure()
        self.phoneInfoLabel.textColor = Theme.with(color: .secondaryTextColor)
        self.phoneInfoLabel.font = Font.with(size: .small, weight: .regular, family: .compactDisplay)
        self.nextButton.configure(type: .primary)

        // Country Code
        self.phoneCountryCodeButton.configure(type: .secondary)
        self.phoneCountryCodeButton.titleLabel?.font = Font.with(size: .body, weight: .regular, family: .display)
        self.phoneCountryCodeButton.backgroundColor = Theme.with(color: .clearColor)
        
        // Bottom
        self.bottomInfoView.configure(infoText: Localization.string(key: "register.bottomInfo", defaultValues: ""), infoButtonText: Localization.string(key: "register.bottomInfoSignIn", defaultValues: ""))
        self.bottomInfoView.delegate = self
    }
    
    private func configureSegment(_ type: SegmentType) {
        var isFirstSegment = false
        switch type {
        case .phone:
            isFirstSegment = true
            self.emailTextField.resignFirstResponder()
        case .email:
            isFirstSegment = false
            self.phoneTextField.resignFirstResponder()

        }
        
        self.phoneSegmentButton.isSelected = isFirstSegment
        self.emailSegmentButton.isSelected = !isFirstSegment
        self.phoneSegmentDivider.isHidden = !isFirstSegment
        self.emailSegmentDivider.isHidden = isFirstSegment
        self.phoneTextFieldContentView.isHidden = !isFirstSegment
        self.emailTextField.isHidden = isFirstSegment
        self.phoneInfoLabel.isHidden = !isFirstSegment
    }
    
    @IBAction private func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func phoneSegmentButtonTapped(_ sender: Any) {
        self.configureSegment(.phone)
    }
    
    @IBAction private func phoneCountryCodeButtonTapped(_ sender: Any) {
        self.viewModel.phoneCountryCodeTapped()
    }
    
    @IBAction private func emailSegmentButtonTapped(_ sender: Any) {
        self.configureSegment(.email)
    }
    
    @IBAction private func nextButtonTapped(_ sender: Any) {
        self.viewModel.nextButtonTapped()
    }
    
}

extension RegisterViewController: RegisterViewModelDelegate {
    
    func navigationToCountryList(viewModel: RegisterCountryListViewModel) {
        let storyboard = UIStoryboard(name: "RegisterCountryList", bundle: nil)
        if let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController, let viewController = navigationController.viewControllers.first as? RegisterCountryListViewController {
            viewController.viewModel = viewModel
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func navigateToNameStep() {
        self.performSegue(withIdentifier: "RegisterNameSegue", sender: nil)
    }
    
    func updateCountryButton(_ text: String) {
        self.phoneCountryCodeButton.setTitle(text, for: .normal)
    }
}

extension RegisterViewController: AuthenticationBottomViewDelegate {
    func viewButtonTapped() {
    }
}
