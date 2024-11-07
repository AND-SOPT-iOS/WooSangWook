//
//  AppStoreInfoView.swift
//  iOS35
//
//  Created by 우상욱 on 10/23/24.
//

import UIKit
import SnapKit
import Then

protocol AppStoreInfoViewDelegate: AnyObject {
    func didTapVersionHistory()
}

class AppStoreInfoView: UIView {
    weak var delegate: AppStoreInfoViewDelegate?
    
    private let titleLabel = UILabel().then {
        $0.text = "새로운 소식"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
    }
    
    private let versionCode = UILabel().then {
        $0.text = "버전 5.186.0"
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .gray
    }
    
    private let versionHistory = UIButton().then {
        $0.setTitle("버전 기록", for: .normal)
        $0.setTitleColor(.tintColor, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.addTarget(self, action: #selector(versionHistoryTapped), for: .touchUpInside)
    }
    
    private let lastDay = UILabel().then {
        $0.text = "1일 전"
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .gray
    }
    
    private let information = UILabel().then {
        $0.text = "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요."
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .white
        $0.numberOfLines = 0
    }
    
    init(){
        super.init(frame: .zero)
        
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppStoreInfoView {
    func addSubviews() {
        [titleLabel, versionCode, versionHistory, lastDay, information].forEach { [weak self] view in
            guard let self else { return }
            self.addSubview(view)
        }
    }
    
    func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().inset(20)
        }
        
        versionCode.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        information.snp.makeConstraints {
            $0.top.equalTo(versionCode.snp.bottom).offset(20)
            $0.leading.equalTo(versionCode.snp.leading)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        
        versionHistory.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        lastDay.snp.makeConstraints {
            $0.top.equalTo(versionHistory.snp.bottom)
            $0.trailing.equalTo(versionHistory.snp.trailing)
        }
    }
}

extension AppStoreInfoView {
    @objc private func versionHistoryTapped() {
        delegate?.didTapVersionHistory()
    }
}
