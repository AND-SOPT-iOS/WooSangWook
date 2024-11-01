//
//  MainViewController.swift
//  iOS35
//
//  Created by 우상욱 on 10/12/24.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
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
    
    private let appStorePreviewView = AppStorePreviewView()
    
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

extension MainViewController {
    
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
        [titleView, chipView, informationView, appStorePreviewView, appStoreReviewView, appStoreEvaluatingView, horizontalDivider1, horizontalDivider2, horizontalDivider3, horizontalDivider4, horizontalDivider5].forEach { [weak self] view in
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
        
        appStorePreviewView.snp.makeConstraints {
            $0.top.equalTo(horizontalDivider3.snp.bottom)
            $0.leading.trailing.equalTo(contentView)
        }
        
        horizontalDivider4.snp.makeConstraints {
            $0.top.equalTo(appStorePreviewView.snp.bottom).offset(20)
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
            $0.leading.trailing.equalTo(contentView).inset(20)
            $0.bottom.equalTo(contentView)
        }
    }
    
    private func setDelegates() {
        informationView.delegate = self
        appStoreReviewView.delegate = self
        appStoreEvaluatingView.delegate = self
    }
}

extension MainViewController : AppStoreInfoViewDelegate {
    func didTapVersionHistory() {
        let nextViewController = VersionHistoryViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension MainViewController : AppStoreReviewViewDelegate {
    func didTapSeeAllButton() {
        let nextViewController = ReviewViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension MainViewController : AppStoreEvaluatingViewDelegate {
    func didTapWriteReviewButton() {
        //TODO
    }
}
