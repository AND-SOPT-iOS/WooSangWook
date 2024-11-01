//
//  VersionHistoryViewController.swift
//  iOS35
//
//  Created by 우상욱 on 10/31/24.
//

import UIKit
import SnapKit
import Then

class VersionHistoryViewController: UIViewController {

    private let titleLabel = UILabel().then {
        $0.text = "버전 기록"
        $0.font = .systemFont(ofSize: 40)
        $0.textColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        self.view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().inset(20)
        }
    }
}
