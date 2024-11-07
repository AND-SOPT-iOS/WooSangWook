//
//  AppViewController.swift
//  iOS35
//
//  Created by 우상욱 on 10/31/24.
//

import UIKit
import SnapKit
import Then

class AppViewController: UIViewController {
    
    private lazy var financialButton = UIButton().then {
        $0.setTitle("금융화면으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30)
        $0.addTarget(self, action: #selector(didTapFinancialButton), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.view.addSubview(financialButton)
        
        financialButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().inset(20)
        }
        
    }
    
    @objc
    private func didTapFinancialButton() {
        financialButtonTapped()
    }

    private func financialButtonTapped() {
        let nextViewController = FinancialViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
