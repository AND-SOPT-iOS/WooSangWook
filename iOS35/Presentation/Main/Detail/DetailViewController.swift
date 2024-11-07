//
//  MainViewController.swift
//  iOS35
//
//  Created by 우상욱 on 10/12/24.
//

import UIKit
import SnapKit
import Then

class DetailViewController: UIViewController {
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let titleView = AppStoreTitleView(
        applogo: UIImage(named: "applogo.png"),
        title: "토스", subTitle: "금융이 쉬워진다.",
        updateState: UpdateState.latest
    )
    
    private let chipView = AppStoreChipView(
        firstChip: AppStoreChip(
            top: "8.4만개의 평가",
            middle: "4.4",
            bottom: "★★★★☆"
        ),
        secondChip: AppStoreChip(
            top: "수상",
            middle: "대상",
            bottom: "앱"
        ),
        thirdChip: AppStoreChip(
            top: "연령",
            middle: "4+",
            bottom: "세"
        )
    )
    
    private let informationView = AppStoreInfoView()
    
    private let previewCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 3
            $0.minimumInteritemSpacing = 3
            $0.itemSize = .init(width: UIScreen.main.bounds.width * 2 / 3.5,  height: UIScreen.main.bounds.height * 2 / 3.3)
        }
    ).then {
        $0.showsHorizontalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.contentInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        $0.register(PreviewCollectionViewCell.self, forCellWithReuseIdentifier: PreviewCollectionViewCell.identifier)
        $0.backgroundColor = .black
    }
    
    private let appStoreReviewView = AppStoreReviewView()
    
    private let appStoreEvaluatingView = AppStoreEvaluatingView()
    
    private let previewLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.text = "미리 보기"
    }
    
    private let previewImage = UIImageView().then {
        $0.image = UIImage(named: "toss.jpg")
    }
    
    private let horizontalDivider1 = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    private let horizontalDivider2 = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    private let horizontalDivider3 = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    private let horizontalDivider4 = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    private let horizontalDivider5 = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addViews()
        setLayout()
        setDelegates()
    }
}

extension DetailViewController {
    
    private func setUI() {
        self.view.backgroundColor = .black
    }
    
    private func addViews() {
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        chipView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        [titleView, chipView, informationView, previewCollectionView, appStoreReviewView, appStoreEvaluatingView, horizontalDivider1, horizontalDivider2, horizontalDivider3, horizontalDivider4, horizontalDivider5].forEach { [weak self] view in
            guard let self else { return }
            contentView.addSubview(view)
        }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        titleView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.leading.trailing.equalTo(contentView)
            $0.height.equalTo(120)
        }
        
        horizontalDivider1.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.leading.trailing.equalTo(contentView).inset(20)
            $0.height.equalTo(0.5)
        }
        
        chipView.snp.makeConstraints {
            $0.top.equalTo(horizontalDivider1.snp.bottom)
            $0.leading.equalTo(contentView)
        }
        
        horizontalDivider2.snp.makeConstraints {
            $0.top.equalTo(chipView.snp.bottom)
            $0.leading.trailing.equalTo(contentView).inset(20)
            $0.height.equalTo(0.5)
        }
        
        informationView.snp.makeConstraints {
            $0.top.equalTo(horizontalDivider2.snp.bottom)
            $0.leading.trailing.equalTo(contentView)
        }
        
        horizontalDivider3.snp.makeConstraints {
            $0.top.equalTo(informationView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView).inset(20)
            $0.height.equalTo(0.5)
        }
        
        previewCollectionView.snp.makeConstraints {
            $0.top.equalTo(horizontalDivider3.snp.bottom).offset(20)
            $0.height.equalTo(UIScreen.main.bounds.height * 2 / 3.3)
            $0.leading.trailing.equalTo(contentView)
        }
        
        horizontalDivider4.snp.makeConstraints {
            $0.top.equalTo(previewCollectionView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView).inset(20)
            $0.height.equalTo(0.5)
        }
        
        appStoreReviewView.snp.makeConstraints {
            $0.top.equalTo(horizontalDivider4.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView)
        }
        
        horizontalDivider5.snp.makeConstraints {
            $0.top.equalTo(appStoreReviewView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView).inset(20)
            $0.height.equalTo(0.5)
        }
        
        appStoreEvaluatingView.snp.makeConstraints {
            $0.top.equalTo(horizontalDivider5.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(contentView)
            $0.bottom.equalTo(contentView)
        }
    }
    
    private func setDelegates() {
        informationView.delegate = self
        appStoreReviewView.delegate = self
        appStoreEvaluatingView.delegate = self
        
        previewCollectionView.delegate = self
        previewCollectionView.dataSource = self
    }
}

extension DetailViewController : AppStoreInfoViewDelegate {
    func didTapVersionHistory() {
        let nextViewController = VersionHistoryViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension DetailViewController : AppStoreReviewViewDelegate {
    func didTapSeeAllButton() {
        let nextViewController = ReviewViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension DetailViewController : AppStoreEvaluatingViewDelegate {
    func didTapWriteReviewButton() {
        //TODO
    }
}

extension DetailViewController : UICollectionViewDelegate {
    
}

extension DetailViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = previewCollectionView.dequeueReusableCell(
            withReuseIdentifier: PreviewCollectionViewCell.identifier,
            for: indexPath
        ) as? PreviewCollectionViewCell else { return UICollectionViewCell() }
            return cell
    }
}
