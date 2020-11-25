//
//  AuthenticationBottomView.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 24.11.2020.
//

import UIKit

final class AuthenticationBottomView: UIView {
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    
    private let viewName: String = "AuthenticationBottomView"
    
    weak var delegate: AuthenticationBottomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        guard let view = self.loadViewFromNib(nibName: "AuthenticationBottomView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configure(infoText: String, infoButtonText: String) {
        self.dividerView.backgroundColor = Theme.with(color: .borderColor)
        self.infoLabel.textColor = Theme.with(color: .placeholderColor)
        self.infoLabel.font = Font.with(size: .small, weight: .regular, family: .display)
        self.infoButton.configure(type: .inline)
        self.infoButton.titleLabel?.font = Font.with(size: .small, weight: .semibold, family: .display)
        
        self.infoLabel.text = infoText
        self.infoButton.setTitle(infoButtonText, for: .normal)
    }

    @IBAction func infoButtonTapped(_ sender: Any) {
        self.delegate?.viewButtonTapped()
    }
 
}
