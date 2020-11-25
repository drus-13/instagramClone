//
//  RegisterCountryListTableViewCell.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 22.11.2020.
//

import UIKit

final class RegisterCountryListTableViewCell: UITableViewCell {
    @IBOutlet private weak var countryTitleLabel: UILabel!
    @IBOutlet private weak var countryCodeLabel: UILabel!
    @IBOutlet private weak var dividerView: UIView!
     
    var presenter: RegisterCountryPresenter! {
        didSet {
            self.countryTitleLabel.textColor = Theme.with(color: .navigationColor)
            self.countryTitleLabel.font = Font.with(size: .heading, weight: .regular, family: .text)
            self.countryTitleLabel.text = presenter.countryName
            
            self.countryCodeLabel.textColor = Theme.with(color: .secondaryTextColor)
            self.countryCodeLabel.font = Font.with(size: .heading, weight: .light, family: .text)
            self.countryCodeLabel.text = presenter.phoneCode
            
            self.dividerView.backgroundColor = Theme.with(color: .separatorColor)
        }
    }
    
}
