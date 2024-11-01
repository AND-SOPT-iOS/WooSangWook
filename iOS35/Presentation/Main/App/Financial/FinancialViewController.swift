//
//  FinancialViewController.swift
//  iOS35
//
//  Created by 우상욱 on 10/31/24.
//

import UIKit
import Combine
import SnapKit
import Then

class FinancialViewController: UIViewController {
    var financialObservable = FinancialObservable()
    private var cancellables = Set<AnyCancellable>()
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        addSubviews()
        setupLayout()
        receiveState()
        receiveSideEffect()
    }
}

extension FinancialViewController {
    
    private func setupStyle() {
        view.backgroundColor = .black
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.barTintColor = .black
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.do {
            $0.register(RecommendCollectionView.self, forCellReuseIdentifier: RecommendCollectionView.identifier)
            $0.register(RecommendAppCollectionView.self, forCellReuseIdentifier: RecommendAppCollectionView.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
            $0.separatorColor = .clear
        }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension FinancialViewController: StateAndSideEffectHandler {
    
    func receiveState(){
        financialObservable.$state
            .receive(on: RunLoop.main)
            .sink{ [weak self] state in
                self?.render(state: state)
            }
            .store(in: &cancellables)
    }
    
    private func render(state: FinancialState) {
        self.navigationItem.title = state.title
        tableView.reloadData()
    }
    
    func receiveSideEffect() {
        financialObservable.sideEffect
            .receive(on: RunLoop.main)
            .sink { [weak self] effect in
                self?.handleSideEffect(effect)
            }
            .store(in: &cancellables)
    }
    
    private func handleSideEffect(_ effect: FinancialSideEffect) {
        switch effect {
        case .navigateToFreeRanking:
            navigateToRankingView()
        case .navigateToDetail(title: let title):
            navigateToDetailView(title: title)
        }
    }
}

extension FinancialViewController {
    @objc
    private func didTapSeeAllButton(){
        financialObservable.sendNavigateToFreeRanking()
    }
    
    private func navigateToRankingView(){
        let nextViewController = RankingViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func navigateToDetailView(title: String) {
        if(title == "토스"){
            let nextViewController = DetailViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}

extension FinancialViewController: UITableViewDelegate {
    
}

extension FinancialViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RecommendCollectionView.identifier,
            for: indexPath
        ) as? RecommendCollectionView else { return UITableViewCell() }
            cell.configure(data: financialObservable.state.recommendList)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        case 1: guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RecommendAppCollectionView.identifier,
            for: indexPath
        ) as? RecommendAppCollectionView else { return UITableViewCell() }
            cell.configure(data: financialObservable.state.necessaryList)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.delegate = self
            return cell
        case 2:guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RecommendAppCollectionView.identifier,
            for: indexPath
        ) as? RecommendAppCollectionView else { return UITableViewCell() }
            cell.configure(data: financialObservable.state.paidList)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.delegate = self
            return cell
        default:guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RecommendAppCollectionView.identifier,
            for: indexPath
        ) as? RecommendAppCollectionView else { return UITableViewCell() }
            cell.configure(data: financialObservable.state.freeList)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.delegate = self
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return UIScreen.main.bounds.height / 2.8
        default: return UIScreen.main.bounds.height / 3.5
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .black
        
        let titleLabel = UILabel().then {
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = .white
        }
        
        let seeAllLabel = UILabel().then {
            $0.text = "모두 보기"
            $0.font = .systemFont(ofSize: 18)
            $0.textColor = .tintColor
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSeeAllButton))
        
        switch section {
        case 1: titleLabel.text = financialObservable.state.secondSectionTitle
        case 2: titleLabel.text = financialObservable.state.thirdSectionTitle
        case 3: titleLabel.text = financialObservable.state.fourthSectionTitle
            seeAllLabel.addGestureRecognizer(tapGesture)
            seeAllLabel.isUserInteractionEnabled = true
        default: return nil
        }
        
        headerView.addSubview(titleLabel)
        headerView.addSubview(seeAllLabel)
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15)
        }
        
        seeAllLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 60
        case 2:
            return 60
        case 3:
            return 60
        default:
            return 0
        }
    }
}

extension FinancialViewController : RecommendAppCollectionViewDelegate {
    func rankingViewTapped(title: String) {
        financialObservable.sendNavigateToDetail(title: title)
    }
}
