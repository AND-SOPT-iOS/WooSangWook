//
//  AppStoreTitleView.swift
//  iOS35
//
//  Created by 우상욱 on 10/23/24.
//

import UIKit
import SnapKit
import Then

class AppStoreTitleView: UIView {
    
    private let appLogo = UIImageView().then {
        $0.image = UIImage(named: "applogo.png")
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
    }
    
    private let subTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .gray
    }
    
    private let openButton = UIButton().then {
        $0.backgroundColor = .tintColor
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.layer.cornerRadius = 15
        $0.setTitleColor(.white, for: .normal)
    }
    
    init(applogo: UIImage?, title: String, subTitle: String, updateState: UpdateState) {
        super.init(frame: .zero)
        
        self.appLogo.image = applogo
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        
        switch(updateState){
        case .latest:
            openButton.setTitle("열기", for: .normal)
        case .required:
            openButton.setTitle("업데이트", for: .normal)
        }
        
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AppStoreTitleView {
    func addSubviews() {
        [appLogo, titleLabel, subTitleLabel, openButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    func setupLayout() {
        appLogo.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(100)
            $0.width.equalTo(100)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(appLogo)
            $0.leading.equalTo(appLogo.snp.trailing).offset(16)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        openButton.snp.makeConstraints {
            $0.bottom.equalTo(appLogo.snp.bottom)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.width.equalTo(70)
        }
    }
}
