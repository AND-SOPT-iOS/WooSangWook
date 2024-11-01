//
//  FinancialState.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import Foundation

struct FinancialState{
    var title: String
    var recommendList: [RecommendApp]
    var necessaryList: [RankingApp]
    var paidList: [RankingApp]
    var freeList: [RankingApp]
    var firstSectionTitle: String
    var secondSectionTitle: String
    var thirdSectionTitle: String
    var fourthSectionTitle: String
    
    init(title: String = "", recommendList: [RecommendApp] = [], necessaryList: [RankingApp] = [], paidList: [RankingApp] = [], freeList: [RankingApp] = [], firstSectionTitle: String = "", secondSectionTitle: String = "", thirdSectionTitle: String = "", fourthSectionTitle: String = "") {
        self.title = title
        self.recommendList = recommendList
        self.necessaryList = necessaryList
        self.paidList = paidList
        self.freeList = freeList
        self.firstSectionTitle = firstSectionTitle
        self.secondSectionTitle = secondSectionTitle
        self.thirdSectionTitle = thirdSectionTitle
        self.fourthSectionTitle = fourthSectionTitle
    }
    
    func copy(
        title: String? = nil,
        recommendList: [RecommendApp]? = nil,
        necessaryList: [RankingApp]? = nil,
        paidList: [RankingApp]? = nil,
        freeList: [RankingApp]? = nil,
        firstSectionTitle: String? = nil,
        secondSectionTitle: String? = nil,
        thirdSectionTitle: String? = nil,
        fourthSectionTitle: String? = nil
    ) -> FinancialState {
        return FinancialState(
            title: title ?? self.title,
            recommendList: recommendList ?? self.recommendList,
            necessaryList: necessaryList ?? self.necessaryList,
            paidList: paidList ?? self.paidList,
            freeList: freeList ?? self.freeList,
            firstSectionTitle: firstSectionTitle ?? self.firstSectionTitle,
            secondSectionTitle: secondSectionTitle ?? self.secondSectionTitle,
            thirdSectionTitle: thirdSectionTitle ?? self.thirdSectionTitle,
            fourthSectionTitle: fourthSectionTitle ?? self.fourthSectionTitle
        )
    }
}
