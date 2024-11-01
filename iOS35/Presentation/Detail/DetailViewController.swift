//
//  DetailViewController.swift
//  iOS35
//
//  Created by 우상욱 on 10/9/24.
//

import UIKit
import SnapKit
import Then

protocol DetailViewControllerDelegate: AnyObject {
    func updateText(text: String)
}

final class DetailViewController: UIViewController {
    weak var delegate: DetailViewControllerDelegate?
    
    var completionHandler: ((String) -> Void)?
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .center
    }
    
    private let contentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.numberOfLines = 0
    }
    
    private let textField = UITextField().then {
        $0.placeholder = "텍스트를 입력해주세요."
        $0.clearButtonMode = .whileEditing
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1
        $0.padding(value: 16)
    }
    
    private lazy var backButton = UIButton().then {
        $0.setTitle("이전 화면으로", for: .normal)
        $0.backgroundColor = .tintColor
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    private lazy var nextButton = UIButton().then {
        $0.setTitle("다음 화면으로", for: .normal)
        $0.backgroundColor = .tintColor
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
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
        let subviews = [titleLabel, contentLabel, textField, backButton, nextButton]
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
        
        textField.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(contentLabel)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(textField).inset(40)
            $0.height.equalTo(40)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(backButton)
            $0.height.equalTo(20)
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
        if let text = textField.text {
            //delegate?.updateText(text: text)
            completionHandler?(text)
        }
        if navigationController == nil {
            dismiss(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc
    private func nextButtonTapped() {
        transitionToNextViewController()
    }
    
    private func transitionToNextViewController() {
        let nextViewController = MainViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
