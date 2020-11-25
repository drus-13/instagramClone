//
//  RegisterInputView.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 25.11.2020.
//

import Foundation
import UIKit

final class RegisterInputView: UIView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var textField: IGTextField!
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var bottomView: AuthenticationBottomView!
    
    private let viewName: String = "RegisterInputView"
    
    weak var delegate: RegisterInputViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        print("RegisterInputView")
        guard let view = self.loadViewFromNib(nibName: "RegisterInputView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configure(title: String, subtitle: String, textFieldPlaceholder: String, buttonTitle: String, bottomInfo: String, bottomInfoButtonTitle: String) {
        
        // Theme
        self.titleLabel.textColor = Theme.with(color: .navigationColor)
        self.titleLabel.font = Font.with(size: .title, weight: .light, family: .text)
        self.subtitleLabel.textColor = Theme.with(color: .secondaryTextColor)
        self.subtitleLabel.font = Font.with(size: .body, weight: .medium, family: .display)
        self.textField.configure()
        self.button.configure(type: .primary)
        
        // Delegate
        self.bottomView.delegate = self
        
        // Texts
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.textField.setPlaceholder(textFieldPlaceholder)
        self.button.setTitle(buttonTitle, for: .normal)
        self.bottomView.configure(infoText: bottomInfo, infoButtonText: bottomInfoButtonTitle)
    }
    
    @IBAction private func buttonTapped(_ sender: Any) {
        self.delegate?.buttonTapped()
    }
    
}

extension RegisterInputView: AuthenticationBottomViewDelegate {
    func viewButtonTapped() {
        self.delegate?.bottomButtonTapped()
    }
}
