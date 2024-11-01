//
//  AppStorePreviewView.swift
//  iOS35
//
//  Created by 우상욱 on 10/23/24.
//

import UIKit

class AppStorePreviewView: UIView {
    private let titleLabel = UILabel().then {
        $0.text = "미리 보기"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
    }
    
    private let preview = UIImageView().then {
        $0.image = UIImage(named: "preview.jpg")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
    }
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppStorePreviewView {
    func addSubviews() {
        [titleLabel, preview].forEach { [weak self] view in
            guard let self else { return }
            self.addSubview(view)
        }
    }
    
    func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        
        preview.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.width.equalTo(200)
            $0.height.equalTo(400)
            $0.bottom.equalToSuperview()
        }
    }
}
