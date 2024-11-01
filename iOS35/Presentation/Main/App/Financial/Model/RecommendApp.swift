//
//  RecommendApp.swift
//  iOS35
//
//  Created by 우상욱 on 10/31/24.
//

import Foundation

struct RecommendApp {
    let recommendType: String
    let title: String
    let subTitle: String
    let imageUri: String
    let iconUri: String
    let appTitle: String
    let appSubTitle: String
    
    init(recommendType: String, title: String, subTitle: String, imageUri: String, iconUri: String, appTitle: String, appSubTitle: String) {
        self.recommendType = recommendType
        self.title = title
        self.subTitle = subTitle
        self.imageUri = imageUri
        self.iconUri = iconUri
        self.appTitle = appTitle
        self.appSubTitle = appSubTitle
    }
}
