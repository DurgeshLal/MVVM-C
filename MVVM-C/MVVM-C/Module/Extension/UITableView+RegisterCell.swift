//
//  UITableView+RegisterCell.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register<T: UITableViewCell> (_: T.Type) where T: ReusableView & NibLoadableView {
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

protocol ReusableView: class {}
extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView: class { }
extension NibLoadableView where Self: UIView {
    static var NibName: String {
        return String(describing: self)
    }
}

