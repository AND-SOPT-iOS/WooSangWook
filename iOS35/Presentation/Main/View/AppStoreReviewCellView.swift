//
//  AppStoreReviewCellView.swift
//  iOS35
//
//  Created by 우상욱 on 10/31/24.
//

import UIKit

class AppStoreReviewCellView: UIView {
    private let titleLabel = UILabel().then {
        $0.text = "토스 UX 전버전으로 해주세요"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .white
    }
    
    private let score = UILabel().then {
        $0.text = "★★★★★"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .orange
    }
    
    private let review = UILabel().then {
        $0.text = "토스 최고입니다. 토스 최고최고최고"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppStoreReviewCellView {
    
    private func setupStyle() {
        self.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        self.layer.cornerRadius = 12
    }
    
    private func addSubviews() {
        [titleLabel, score, review].forEach {[weak self] view in
            guard let self else { return }
            self.addSubview(view)
        }
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        score.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        review.snp.makeConstraints {
            $0.top.equalTo(score.snp.bottom).offset(20)
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
}
