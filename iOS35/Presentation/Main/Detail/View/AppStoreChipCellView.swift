//
//  AppStoreChipCellView.swift
//  iOS35
//
//  Created by 우상욱 on 10/25/24.
//

import UIKit
import SnapKit
import Then

class AppStoreChipCellView: UIView {
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 5
        $0.alignment = .center
    }
    private let topView = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .gray
        $0.textAlignment = .center
    }
    private let middleView = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .lightGray
        $0.textAlignment = .center
    }
    private let bottomView = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .lightGray
        $0.textAlignment = .center
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

extension AppStoreChipCellView {
    
    private func addSubviews() {
        self.addSubview(stackView)
        [topView, middleView, bottomView].forEach { stackView.addArrangedSubview($0) }
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func setTitle(chip: AppStoreChip) {
        self.topView.text = chip.top
        self.middleView.text = chip.middle
        self.bottomView.text = chip.bottom
    }
}
