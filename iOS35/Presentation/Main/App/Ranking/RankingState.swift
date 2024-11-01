//
//  RankingState.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import Foundation

struct RankingState {
    var title: String
    var rankingList: [RankingApp]
    
    init(title: String = "", rankingList: [RankingApp] = []) {
        self.title = title
        self.rankingList = rankingList
    }
    
    func copy(title: String? = nil, rankingList: [RankingApp]? = nil) -> RankingState {
        return RankingState(
            title: title ?? self.title,
            rankingList: rankingList ?? self.rankingList
        )
    }
}
