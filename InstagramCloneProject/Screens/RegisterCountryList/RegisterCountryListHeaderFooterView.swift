//
//  RegisterCountryListHeaderFooterView.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 22.11.2020.
//

import UIKit

final class RegisterCountryListHeaderFooterView: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var dividerView: UIView!
    @IBOutlet private weak var contentTitleLabel: UILabel!
    
    func configure() {
        self.backgroundColor = Theme.with(color: .viewBackgroundColor)
        self.dividerView.backgroundColor = Theme.with(color: .separatorColor)
        self.contentTitleLabel.textColor = Theme.with(color: .secondaryTextColor)
        self.contentTitleLabel.font = Font.with(size: .small, weight: .medium, family: .display)

    }

}
