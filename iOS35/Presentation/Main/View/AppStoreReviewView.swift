//
//  AppStoreReviewView.swift
//  iOS35
//
//  Created by 우상욱 on 10/23/24.
//

import UIKit
protocol AppStoreReviewViewDelegate: AnyObject {
    func didTapSeeAllButton()
}
class AppStoreReviewView: UIView {
    weak var delegate: AppStoreReviewViewDelegate?
    
    private let titleLabel = UILabel().then {
        $0.text = "평가 및 리뷰"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
    }
    
    private let evaluatingScore = UILabel().then {
        $0.text = "4.4"
        $0.font = .systemFont(ofSize: 60, weight: .bold)
        $0.textColor = .white
    }
    
    private let perfectScore = UILabel().then {
        $0.text = "5점 만점"
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .gray
    }
    
    private let seeAllButton = UIButton().then {
        $0.setTitle("모두 보기", for: .normal)
        $0.setTitleColor(.tintColor, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
    }
    
    private let starScore = UILabel().then {
        $0.text = "★★★★☆"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .gray
    }
    
    private let evaluatingCount = UILabel().then {
        $0.text = "8.4만개의 평가"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .gray
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

extension AppStoreReviewView {
    private func addSubviews() {
        [titleLabel, evaluatingScore, perfectScore, seeAllButton, starScore, evaluatingCount].forEach { [weak self] view in
            guard let self else { return }
            self.addSubview(view)
        }
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        evaluatingScore.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        perfectScore.snp.makeConstraints {
            $0.top.equalTo(evaluatingScore.snp.bottom)
            $0.centerX.equalTo(evaluatingScore)
            $0.bottom.equalToSuperview()
        }
        
        seeAllButton.snp.makeConstraints {
            $0.bottom.equalTo(titleLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        starScore.snp.makeConstraints {
            $0.centerY.equalTo(evaluatingScore.snp.centerY)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        evaluatingCount.snp.makeConstraints {
            $0.top.equalTo(perfectScore.snp.top)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview()
        }
    }
}

extension AppStoreReviewView {
    @objc
    private func seeAllButtonTapped() {
        delegate?.didTapSeeAllButton()
    }
}
