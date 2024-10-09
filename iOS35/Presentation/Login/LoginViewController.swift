//
//  LoginViewController.swift
//  iOS35
//
//  Created by 우상욱 on 10/9/24.
//

import UIKit
import SnapKit
import Then

final class LoginViewController: UIViewController {
    private let titleTextField = UITextField().then {
        $0.placeholder = "제목을 입력해주세요."
        $0.clearButtonMode = .whileEditing
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1
        $0.padding(value: 16)
    }
    
    private let contentTextView = UITextView().then {
        $0.font = .systemFont(ofSize: 14)
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
    }
    
    private lazy var nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.backgroundColor = .tintColor
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    private lazy var pushModeToggle = UISegmentedControl(items: ["네비게이션", "모달"]).then {
        $0.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        $0.layer.cornerRadius = 10.0
        $0.selectedSegmentIndex = 0
        $0.addTarget(self, action: #selector(toggleButtonTapped), for: .valueChanged)
    }
    
    private var pushMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        addSubviews()
        setupLayout()
    }
}

private extension LoginViewController {
    private func setupStyle() {
        self.view.backgroundColor = .white
    }
    
    private func addSubviews() {
        [titleTextField, contentTextView, nextButton, pushModeToggle].forEach { [weak self] view in
            guard let self else { return }
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
    }
    
    private func setupLayout() {
        titleTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(titleTextField)
            $0.height.equalTo(200)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(contentTextView.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(contentTextView).inset(40)
            $0.height.equalTo(40)
        }
        
        pushModeToggle.snp.makeConstraints {
            $0.top.equalTo(nextButton.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(nextButton)
            $0.height.equalTo(40)
        }
    }
}

private extension LoginViewController {
    @objc
    private func nextButtonTapped() {
        transitionToNextViewController()
    }
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        guard let title = titleTextField.text,
              let content = contentTextView.text
        else {
            return
        }
        
        nextViewController.updateTitleAndContents(title: title, contents: content)
        
        if pushMode {
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.present(
                nextViewController,
                animated: true
            )
        }
    }
    
    @objc
    private func toggleButtonTapped() {
        self.pushMode.toggle()
        self.updateUI()
    }
    
    private func updateUI() {
        self.pushModeToggle.selectedSegmentIndex = pushMode ? 0 : 1
    }
}

