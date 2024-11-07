//
//  UITableViewCell+.swift
//  iOS35
//
//  Created by 우상욱 on 10/31/24.
//

import UIKit

extension UITableViewCell {
    static var identifier : String {
        return String(describing: self)
    }
    
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}
