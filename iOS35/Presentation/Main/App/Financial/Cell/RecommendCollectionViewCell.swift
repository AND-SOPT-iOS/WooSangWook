//
//  RecommendCollectionViewCell.swift
//  iOS35
//
//  Created by 우상욱 on 10/31/24.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    private let recommendLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .tintColor
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .white
    }
    
    private let subTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .darkGray
    }
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
    }
    
    private let appIcon = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
    }
    
    private let appTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .white
    }
    
    private let appSubTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .darkGray
    }
    
    private let downloadButton = UIButton().then {
        $0.setTitle("받기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
    }
    
    private let bottomBlurView = UIView().then {
        $0.setBlurView(style: .systemThinMaterialDark, radius: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecommendCollectionViewCell {
    private func addSubviews(){
        [recommendLabel, titleLabel, subTitleLabel, imageView].forEach { [weak self] view in
            guard let self else { return }
            contentView.addSubview(view)
        }
        
        [bottomBlurView, appIcon, appTitle, appSubTitle, downloadButton].forEach {
            imageView.addSubview($0)
        }
    }
    
    private func setupLayout(){
        recommendLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(5)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(recommendLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(5)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(5)
        }
        imageView.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(UIScreen.main.bounds.height/4)
        }
        
        bottomBlurView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        appIcon.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.bottom.leading.equalToSuperview().inset(10)
        }
        
        appTitle.snp.makeConstraints {
            $0.leading.equalTo(appIcon.snp.trailing).offset(10)
            $0.top.equalTo(appIcon.snp.top)
        }
        
        appSubTitle.snp.makeConstraints {
            $0.leading.equalTo(appIcon.snp.trailing).offset(10)
            $0.bottom.equalTo(appIcon.snp.bottom)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalTo(appIcon.snp.centerY)
            $0.width.equalTo(70)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
}

extension RecommendCollectionViewCell {
    func configure(with recommendApp: RecommendApp){
        recommendLabel.text = recommendApp.recommendType
        titleLabel.text = recommendApp.title
        subTitleLabel.text = recommendApp.subTitle
        imageView.image = UIImage(named: recommendApp.imageUri)
        appIcon.image = UIImage(named: recommendApp.iconUri)
        appTitle.text = recommendApp.appTitle
        appSubTitle.text = recommendApp.appSubTitle
    }
}
