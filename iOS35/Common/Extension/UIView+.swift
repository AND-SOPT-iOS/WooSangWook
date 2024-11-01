//
//  UIView+.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import UIKit
import SnapKit
import Then

extension UIView {
    func setBlurView(style: UIBlurEffect.Style, radius: CGFloat) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        self.addSubview(blurEffectView)
        self.sendSubviewToBack(blurEffectView)
        
        blurEffectView.layer.cornerRadius = radius
        blurEffectView.clipsToBounds = true
        
        blurEffectView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setGradient(color1: UIColor, color2: UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        gradient.frame = bounds
        gradient.cornerRadius = 35
        
        layer.addSublayer(gradient)
    }
}
