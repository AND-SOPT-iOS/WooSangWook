//
//  MyPageViewController.swift
//  iOS35
//
//  Created by 우상욱 on 11/8/24.
//

import UIKit
import Combine
import SnapKit
import Then

class MyPageViewController: UIViewController {
    let myPageIntentManager = MyPageIntentManager()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let titleLabel = UILabel().then {
        $0.text = "내 취미 : "
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .white
    }
    
    private let hobbyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .white
    }
    
    private lazy var logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .darkGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        addSubviews()
        setupLayout()
        addTargets()
        receiveState()
        receiveSideEffect()
    }
    
    private func setupStyle() {
        self.view.backgroundColor = .black
    }
    
    private func addSubviews() {
        [titleLabel, hobbyLabel, logoutButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func setupLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(20)
        }
        
        hobbyLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top)
            $0.leading.equalTo(titleLabel.snp.trailing)
        }
        
        logoutButton.snp.makeConstraints {
            $0.top.equalTo(hobbyLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
        }
    }
    
    private func addTargets() {
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func logoutButtonTapped() {
        myPageIntentManager.LogOut()
    }
}

extension MyPageViewController: StateAndSideEffectHandler {
    func receiveState() {
        myPageIntentManager.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                self?.hobbyLabel.text = state.hobby
            }
            .store(in: &cancellables)
    }
    
    func receiveSideEffect() {
        myPageIntentManager.sideEffect
            .receive(on: DispatchQueue.main)
            .sink { [weak self] effect in
                switch effect {
                case .LogOutSuccess:
                    self?.navigateToLogin()
                }
            }
            .store(in: &cancellables)
    }
}

extension MyPageViewController {
    private func navigateToLogin(){
        let nextViewController = LoginViewController()
        self.navigationController?.setViewControllers([nextViewController], animated: true)
    }
}
