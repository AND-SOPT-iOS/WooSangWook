//
//  RankingTableViewCell.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import UIKit
import SnapKit
import Then
protocol RankingTableViewCellDelegate: AnyObject {
    func rankingTableViewCellTapped(title: String)
}
class RankingTableViewCell: UITableViewCell {
    weak var delegate: RankingTableViewCellDelegate?
    
    private let appIcon = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
    }
    
    private let rankLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .white
    }
    
    private let appTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .white
    }
    
    private let appSubTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    private let downloadButton = UIButton().then {
        $0.setTitle("받기", for: .normal)
        $0.setTitleColor(.tintColor, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(white: 0.1, alpha: 1)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .black
        self.selectionStyle = .none
        
        addSubviews()
        setupLayout()
        setupEvent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RankingTableViewCell {
    
    private func addSubviews() {
        [appIcon, rankLabel, appTitle, appSubTitle, downloadButton].forEach { [weak self] view in
            guard let self else { return }
            contentView.addSubview(view)
        }
    }
    
    private func setupLayout() {
        appIcon.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(60)
            $0.top.bottom.equalToSuperview().inset(10)
        }
        rankLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(appIcon.snp.trailing).offset(10)
        }
        appTitle.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.top)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(10)
        }
        appSubTitle.snp.makeConstraints {
            $0.top.equalTo(appTitle.snp.bottom).offset(10)
            $0.leading.equalTo(appTitle.snp.leading)
        }
        downloadButton.snp.makeConstraints {
            $0.centerY.equalTo(appIcon.snp.centerY)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(75)
        }
    }
    
    private func setupEvent() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapRankingTableViewCell))
        contentView.addGestureRecognizer(tapGesture)
        contentView.isUserInteractionEnabled = true
    }
}

extension RankingTableViewCell {
    func configure(with rankingApp: RankingApp) {
        appIcon.image = UIImage(named: rankingApp.iconUri)
        rankLabel.text = rankingApp.rank == 0 ? "" : String(rankingApp.rank)
        appTitle.text = rankingApp.title
        appSubTitle.text = rankingApp.subTitle
        downloadButton.setTitle("받기", for: .normal)
    }
}

extension RankingTableViewCell {
    @objc
    private func didTapRankingTableViewCell(){
        if let title = appTitle.text {
            delegate?.rankingTableViewCellTapped(title: title)
        }
    }
}
