//
//  FinancialObservable.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import Combine
import Foundation

class FinancialObservable: ObservableObject {
    @Published var state: FinancialState = FinancialState()
    
    let sideEffect = PassthroughSubject<FinancialSideEffect, Never>()
    
    init() {
        state = state.copy(
            title: "금융",
            recommendList: [
                RecommendApp(
                    recommendType: "새로운 경험",
                    title: "Fortune City - A Finance App",
                    subTitle: "게임을 하듯 관리하는 가계부",
                    imageUri: "FortuneCity",
                    iconUri: "FortuneCityLogo",
                    appTitle: "Fortune City",
                    appSubTitle: "좋은 소비습관을 만들어요!"
                ),
                RecommendApp(
                    recommendType: "추천",
                    title: "Taxnote 부기 및 회계 앱",
                    subTitle: "간편한 장부 관리",
                    imageUri: "Taxnote",
                    iconUri: "TaxnoteLogo",
                    appTitle: "Taxnote",
                    appSubTitle: "자영업자용 세금 환급을 위한..."
                ),
                RecommendApp(
                    recommendType: "추천",
                    title: "Currenzy",
                    subTitle: "빠르고 쉬운 환율 계산",
                    imageUri: "Currenzy",
                    iconUri: "CurrenzyLogo",
                    appTitle: "Currenzy",
                    appSubTitle: "금융"
                )
            ],
            necessaryList: [
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 1),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 2),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 3),
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 4),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 5),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 6),
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 7),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 8),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 9),
            ],
            paidList: [
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 1),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 2),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 3),
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 4),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 5),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 6),
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 7),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 8),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 9),
            ],
            freeList: [
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 1),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 2),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 3),
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 4),
                RankingApp(title: "Taxnote", subTitle: "간편한 장부 관리", iconUri: "TaxnoteLogo", rank: 5),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 6),
                RankingApp(title: "Fortune City", subTitle: "게임을 하듯 관리하는 가계부", iconUri: "FortuneCityLogo", rank: 7),
                RankingApp(title: "토스", subTitle: "금융이 쉬워진다", iconUri: "applogo", rank: 8),
                RankingApp(title: "Currenzy", subTitle: "빠르고 쉬운 환율 계산", iconUri: "CurrenzyLogo", rank: 9),
            ],
            firstSectionTitle: "",
            secondSectionTitle: "필수 금융 앱",
            thirdSectionTitle: "유료 순위",
            fourthSectionTitle: "무료 순위"
        )
    }
    
    func sendNavigateToFreeRanking() {
        sideEffect.send(.navigateToFreeRanking)
    }
    
    func sendNavigateToDetail(title: String) {
        sideEffect.send(.navigateToDetail(title: title))
    }
}
