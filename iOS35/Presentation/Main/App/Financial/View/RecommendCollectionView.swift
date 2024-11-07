//
//  RecommendTableViewCell.swift
//  iOS35
//
//  Created by 우상욱 on 10/31/24.
//

import UIKit
import SnapKit
import Then

class RecommendCollectionView: UITableViewCell {
    private var recommendList : [RecommendApp]?
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: SnappingCollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 3
            $0.minimumInteritemSpacing = 3
            $0.itemSize = .init(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height/2.8)
        }
    ).then {
        $0.showsHorizontalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.contentInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        $0.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
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
}
extension RecommendCollectionView {
    
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
}

extension RecommendCollectionView {
    
    func configure(data: [RecommendApp]){
        recommendList = data
    }
}

extension RecommendCollectionView: UICollectionViewDelegate {
    
}

extension RecommendCollectionView: UICollectionViewDataSource {
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
            withReuseIdentifier: RecommendCollectionViewCell.identifier,
            for: indexPath
        ) as? RecommendCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let recommendList = recommendList {
            item.configure(with: recommendList[indexPath.row])
        }
        return item
    }
}
