//
//  ReviewCollectionViewCell.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {
    private let appStoreReviewCellView = AppStoreReviewCellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        
        addSubview(appStoreReviewCellView)
        
        appStoreReviewCellView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
