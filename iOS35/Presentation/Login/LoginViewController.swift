//
//  LoginViewController.swift
//  iOS35
//
//  Created by 우상욱 on 11/2/24.
//

import UIKit
import SnapKit
import Then
import Combine

class LoginViewController: UIViewController {
    var loginIntentManager = LoginIntentManager()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let idTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(
            string: "아이디를 입력해주세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        $0.textColor = .white
        $0.clearButtonMode = .whileEditing
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1
        $0.autocapitalizationType = .none
        $0.padding(value: 16)
    }
    
    private let pwTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(
            string: "비밀번호를 입력해주세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        $0.textColor = .white
        $0.clearButtonMode = .whileEditing
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1
        $0.autocapitalizationType = .none
        $0.padding(value: 16)
    }
    
    private lazy var loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 20
    }
    
    private lazy var signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 20
    }
    
    private let errorMessage = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .white
        $0.textAlignment = .center
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
    
    override func viewWillAppear(_ animated: Bool) {
        loginIntentManager.checkAutoLogin()
    }
    
    private func setupStyle() {
        self.view.backgroundColor = .black
    }
    
    private func addSubviews() {
        [idTextField, pwTextField, loginButton, signUpButton, errorMessage].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func setupLayout() {
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField).offset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
        }
        errorMessage.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func addTargets() {
        idTextField.addTarget(self, action: #selector(idTextFieldDidChanged(_:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextFieldDidChanged(_:)), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
    }
    
    @objc
    private func idTextFieldDidChanged(_ textField: UITextField){
        loginIntentManager.updateId(id: textField.text ?? "")
    }
    
    @objc
    private func pwTextFieldDidChanged(_ textField: UITextField){
        loginIntentManager.updatePw(pw: textField.text ?? "")
    }
    
    @objc
    private func didTapLoginButton(){
        loginIntentManager.login()
    }
    
    @objc
    private func didTapSignupButton(){
        loginIntentManager.sendNavigateToSignUp()
    }
}

extension LoginViewController: StateAndSideEffectHandler{
    func receiveState(){
        loginIntentManager.$state
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] state in
                self?.render(state: state)
            }
            .store(in: &cancellables)
    }
    
    private func render(state: LoginState) {
        errorMessage.text = state.errorMessage
    }
    
    func receiveSideEffect() {
        loginIntentManager.sideEffect
            .receive(on: DispatchQueue.main)
            .sink { [weak self] effect in
                self?.handleSideEffect(effect)
            }
            .store(in: &cancellables)
    }
    
    private func handleSideEffect(_ effect: LoginSideEffect) {
        switch effect {
        case .NavigateToMain:
            navigateToMain()
        case .NavigateToSignUp:
            navigateToSignUp()
        }
    }
}

extension LoginViewController {
    func navigateToMain() {
        let nextViewController = MyPageViewController()
        self.navigationController?.setViewControllers([nextViewController], animated: true)
    }
    
    func navigateToSignUp() {
        let nextViewController = SignUpViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
