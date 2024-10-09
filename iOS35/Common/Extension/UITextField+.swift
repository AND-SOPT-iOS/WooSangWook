//
//  UITextField+.swift
//  iOS35
//
//  Created by 우상욱 on 10/9/24.
//

import UIKit

extension UITextField {
    func padding(value: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
