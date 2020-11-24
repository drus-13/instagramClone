//
//  UITableViewExtension.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 22.11.2020.
//

import Foundation
import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(nibWithClass name: T.Type) {
        let nib = UINib(nibName: String(describing: name), bundle: Bundle(for: T.self))
        self.register(nib, forCellReuseIdentifier: String(describing: name))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        return (self.dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T)!
    }
    
    func register<T: UITableViewHeaderFooterView>(headerFooterViewClass name: T.Type) {
        let nib = UINib(nibName: String(describing: name), bundle: Bundle(for: T.self))
        self.register(nib, forHeaderFooterViewReuseIdentifier: String(describing: name))
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass name: T.Type) -> T? {
        self.dequeueReusableHeaderFooterView(withIdentifier: String(describing: name)) as? T
    }
}
