//
//  RankingObservable.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import Foundation
import Combine

class RankingObservable: ObservableObject {
    @Published var state: RankingState = RankingState()
    let sideEffect = PassthroughSubject<RankingSideEffect, Never>()
    
    init() {
        state = state.copy(
            title: "인기 차트",
            rankingList: [
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 1),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 2),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 3),
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 4),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 5),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 6),
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 7),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 8),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 9),
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 10),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 11),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 12),
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 13),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 14),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 15),
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 16),
                RankingApp(title: "토스", subTitle: "금융이 쉬워진다", iconUri: "applogo", rank: 17),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 18),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 19),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 20),
            ]
        )
    }
    
    func sendNavigateToDetail(title: String) {
        sideEffect.send(.navigateToDetail(title: title))
    }
}
