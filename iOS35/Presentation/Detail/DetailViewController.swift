//
//  DetailViewController.swift
//  iOS35
//
//  Created by 우상욱 on 10/9/24.
//

import UIKit
import SnapKit
import Then

final class DetailViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .center
    }
    
    private let contentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.numberOfLines = 0
    }
    
    private lazy var backButton = UIButton().then {
        $0.setTitle("이전 화면으로", for: .normal)
        $0.backgroundColor = .tintColor
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        addSubviews()
        setupLayout()
    }
}

private extension DetailViewController {
    
    private func setupStyle() {
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        let subviews = [titleLabel, contentLabel, backButton]
        subviews.forEach { view.addSubview($0) }
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(contentLabel).inset(40)
            $0.height.equalTo(40)
        }
    }
}

extension DetailViewController {
    
    func updateTitleAndContents(title: String, contents: String) {
        titleLabel.text = title
        contentLabel.text = contents
    }
}

private extension DetailViewController {
    
    @objc
    private func backButtonTapped() {
        if navigationController == nil {
            dismiss(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
