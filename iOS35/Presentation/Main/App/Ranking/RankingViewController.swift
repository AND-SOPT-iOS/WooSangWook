//
//  RankingViewController.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import UIKit
import Combine
import SnapKit
import Then

class RankingViewController: UIViewController {
    private let rankingObservable = RankingObservable()
    
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

extension RankingViewController {
    private func setupStyle() {
        self.view.backgroundColor = .black
        navigationItem.title = ""
    }
    
    private func addSubviews() {
        self.view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.do {
            $0.register(RankingTableViewCell.self, forCellReuseIdentifier: RankingTableViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
            $0.separatorColor = .clear
            $0.sectionHeaderHeight = 0
            $0.sectionFooterHeight = 0
        }
        
        tableView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}

extension RankingViewController: StateAndSideEffectHandler {
    func receiveState(){
        rankingObservable.$state
            .receive(on: RunLoop.main)
            .sink{ [weak self] state in
                self?.render(state: state)
            }
            .store(in: &cancellables)
    }
    
    private func render(state: RankingState) {
        self.navigationItem.title = state.title
        tableView.reloadData()
    }
    
    func receiveSideEffect() {
        rankingObservable.sideEffect
            .receive(on: RunLoop.main)
            .sink { [weak self] effect in
                self?.handleSideEffect(effect)
            }
            .store(in: &cancellables)
    }
    
    private func handleSideEffect(_ effect: RankingSideEffect) {
        switch effect {
        case .navigateToDetail(title: let title):
            navigateToDetail(title: title)
        }
    }
}

extension RankingViewController {
    private func navigateToDetail(title: String) {
        if(title == "토스"){
            let nextViewController = DetailViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}

extension RankingViewController: UITableViewDelegate {
    
}

extension RankingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankingObservable.state.rankingList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RankingTableViewCell.identifier,
            for: indexPath
        ) as? RankingTableViewCell else { return UITableViewCell() }
        cell.configure(with: rankingObservable.state.rankingList[indexPath.row])
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.delegate = self
        return cell
    }
}

extension RankingViewController : RankingTableViewCellDelegate {
    func rankingTableViewCellTapped(title: String) {
        rankingObservable.sendNavigateToDetail(title: title)
    }
}
