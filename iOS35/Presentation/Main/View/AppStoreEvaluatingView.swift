//
//  AppStoreEvaluatingView.swift
//  iOS35
//
//  Created by 우상욱 on 10/30/24.
//

import UIKit
import SnapKit
import Then

protocol AppStoreEvaluatingViewDelegate: AnyObject {
    func didTapWriteReviewButton()
}

class AppStoreEvaluatingView: UIView {
    weak var delegate : AppStoreEvaluatingViewDelegate?
    
    private let titleLabel = UILabel().then {
        $0.text = "탭하여 평가하기:"
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .gray
    }
    
    private let starGazer = UIView()
    
    private var stars: [UIImageView] = (0..<5).map { _ in
        let star = UIImageView()
        star.image = UIImage(systemName: "star")
        star.isUserInteractionEnabled = true
        return star
    }
    
    private let appStoreReviewCellView = AppStoreReviewCellView()
    
    private let reviewButton = UIButton().then {
        $0.setTitle("리뷰 작성", for: .normal)
        $0.setTitleColor(.tintColor, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.addTarget(self, action: #selector(writeReviewButtonTapped), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppStoreEvaluatingView {
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(starGazer)
        addSubview(appStoreReviewCellView)
        addSubview(reviewButton)
    }
    
    private func setupView() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        starGazer.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(titleLabel)
            $0.height.equalTo(30)
            $0.width.equalTo(180)
        }
        
        appStoreReviewCellView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        reviewButton.snp.makeConstraints {
            $0.top.equalTo(appStoreReviewCellView.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-40)
        }
        
        
        setupStars()
    }
    
    private func setupStars() {
        stars.enumerated().forEach { index, star in
            starGazer.addSubview(star)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(starTapped(_:)))
            star.addGestureRecognizer(tapGesture)
            star.tag = index
            
            star.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.width.height.equalTo(30)
                
                if index == 0 {
                    $0.leading.equalToSuperview()
                } else {
                    $0.leading.equalTo(stars[index - 1].snp.trailing).offset(8)
                }
            }
        }
    }
}

extension AppStoreEvaluatingView {
    
    @objc private func starTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedStar = sender.view as? UIImageView else { return }
        let tappedIndex = tappedStar.tag
        
        for (index, star) in stars.enumerated() {
            star.image = index <= tappedIndex ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        }
    }
    
    @objc private func writeReviewButtonTapped() {
        delegate?.didTapWriteReviewButton()
    }
}
