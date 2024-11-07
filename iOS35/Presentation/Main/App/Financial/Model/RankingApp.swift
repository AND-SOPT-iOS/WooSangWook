//
//  RankingApp.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import Foundation

struct RankingApp {
    let title: String
    let subTitle: String
    let iconUri: String
    let rank: Int
    
    init(title: String, subTitle: String, iconUri: String, rank: Int) {
        self.title = title
        self.subTitle = subTitle
        self.iconUri = iconUri
        self.rank = rank
    }
}

