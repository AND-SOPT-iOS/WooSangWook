//
//  AppStoreChipView.swift
//  iOS35
//
//  Created by 우상욱 on 10/23/24.
//

import UIKit
import SnapKit
import Then

class AppStoreChipView: UIView {
    private let firstCell = AppStoreChipCellView()
    
    private let secondCell = AppStoreChipCellView()
    
    private let thirdCell = AppStoreChipCellView()
    
    private let verticalDivider1 = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    private let verticalDivider2 = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    init(firstChip: AppStoreChip, secondChip: AppStoreChip, thirdChip: AppStoreChip) {
        super.init(frame: .zero)
        
        addSubviews()
        setupLayout()
        setupChips(firstChip: firstChip, secondChip: secondChip, thirdChip: thirdChip)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppStoreChipView{
    func addSubviews(){
        [firstCell, secondCell, thirdCell, verticalDivider1, verticalDivider2].forEach { [weak self] view in
            guard let self else { return }
            self.addSubview(view)
        }
    }
    
    func setupLayout(){
        [firstCell, secondCell, thirdCell].forEach {
            $0.snp.makeConstraints {
                $0.width.equalTo(120)
            }
        }
        
        [verticalDivider1, verticalDivider2].forEach {
            $0.snp.makeConstraints {
                $0.width.equalTo(0.5)
            }
        }
        
        firstCell.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.leading.equalToSuperview().inset(20)
        }
        
        verticalDivider1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.equalTo(firstCell.snp.trailing)
        }
        
        secondCell.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.leading.equalTo(verticalDivider1.snp.trailing)
        }
        
        verticalDivider2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.equalTo(secondCell.snp.trailing)
        }
        
        thirdCell.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.leading.equalTo(verticalDivider2.snp.trailing)
        }
        
    }
    
    func setupChips(firstChip: AppStoreChip, secondChip: AppStoreChip, thirdChip: AppStoreChip) {
        firstCell.setTitle(chip: firstChip)
        secondCell.setTitle(chip: secondChip)
        thirdCell.setTitle(chip: thirdChip)
    }
}
