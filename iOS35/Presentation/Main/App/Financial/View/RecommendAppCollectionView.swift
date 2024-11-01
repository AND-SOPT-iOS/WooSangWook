//
//  RankingCollectionView.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import UIKit

protocol RecommendAppCollectionViewDelegate: AnyObject {
    func rankingViewTapped(title: String)
}

class RecommendAppCollectionView: UITableViewCell {
    weak var delegate: RecommendAppCollectionViewDelegate?
    
    private var rankingList : [RankingApp]?
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: SnappingCollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 3
            $0.minimumInteritemSpacing = 3
            $0.itemSize = .init(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height/4)
        }
    ).then {
        $0.showsHorizontalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.contentInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        $0.register(RecommendAppCollectionViewCell.self, forCellWithReuseIdentifier: RecommendAppCollectionViewCell.identifier)
        $0.backgroundColor = .clear
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .black
        
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.horizontalEdges.equalToSuperview()
        }
    }
    
    func configure(data: [RankingApp]) {
        rankingList = data
    }
}

extension RecommendAppCollectionView: UICollectionViewDelegate {
    
}

extension RecommendAppCollectionView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 3
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecommendAppCollectionViewCell.identifier,
            for: indexPath
        ) as? RecommendAppCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let rankingList = rankingList {
            let startIndex = indexPath.row * 3
            let endIndex = min(startIndex + 3, rankingList.count)
            let subset = Array(rankingList[startIndex..<endIndex])
            item.configure(appList: subset)
        }
        item.delegate = self
        return item
    }
}

extension RecommendAppCollectionView: RecommendAppCollectionViewCellDelegate {
    func rankingViewTapped(title: String) {
        delegate?.rankingViewTapped(title: title)
    }
}
