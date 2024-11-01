//
//  RecommendAppCollectionViewCell.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import UIKit

protocol RecommendAppCollectionViewCellDelegate: AnyObject {
    func rankingViewTapped(title: String)
}

class RecommendAppCollectionViewCell: UICollectionViewCell {
    weak var delegate : RecommendAppCollectionViewCellDelegate?
    
    private let firstRankingView = RankingTableViewCell(style: .default, reuseIdentifier: nil)
    
    private let secondRankingView = RankingTableViewCell(style: .default, reuseIdentifier: nil)
    
    private let thirdRankingView = RankingTableViewCell(style: .default, reuseIdentifier: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        addSubviews()
        setupLayout()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecommendAppCollectionViewCell {
    
    private func addSubviews() {
        [firstRankingView, secondRankingView, thirdRankingView].forEach { [weak self] view in
            guard let self else { return }
            contentView.addSubview(view)
        }
    }
    
    private func setupLayout() {
        firstRankingView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(80)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        
        secondRankingView.snp.makeConstraints {
            $0.top.equalTo(firstRankingView.snp.bottom)
            $0.height.equalTo(80)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        
        thirdRankingView.snp.makeConstraints {
            $0.top.equalTo(secondRankingView.snp.bottom)
            $0.height.equalTo(80)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
    }
    
    private func setupDelegates() {
        firstRankingView.delegate = self
        secondRankingView.delegate = self
        thirdRankingView.delegate = self
    }
}

extension RecommendAppCollectionViewCell {
    func configure(appList: [RankingApp]){
        firstRankingView.configure(with: appList[0])
        secondRankingView.configure(with: appList[1])
        thirdRankingView.configure(with: appList[2])
    }
}

extension RecommendAppCollectionViewCell : RankingTableViewCellDelegate {
    func rankingTableViewCellTapped(title: String) {
        delegate?.rankingViewTapped(title: title)
    }
}
