//
//  MainTabBarController.swift
//  iOS35
//
//  Created by 우상욱 on 10/31/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayViewController = TodayViewController()
        let gameViewController = GameViewController()
        let appViewController = AppViewController()
        let arcadeViewController = ArcadeViewController()
        let searchViewController = SearchViewController()
        
        let todayNavController = UINavigationController(rootViewController: todayViewController)
        let gameNavController = UINavigationController(rootViewController: gameViewController)
        let appNavController = UINavigationController(rootViewController: appViewController)
        let arcadeNavController = UINavigationController(rootViewController: arcadeViewController)
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        
        todayNavController.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "note.text"), tag: 0)
        gameNavController.tabBarItem = UITabBarItem(title: "게임", image: UIImage(systemName: "arcade.stick"), tag: 1)
        appNavController.tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up.fill"), tag: 2)
        arcadeNavController.tabBarItem = UITabBarItem(title: "Arcade", image: UIImage(systemName: "arcade.stick"), tag: 3)
        searchNavController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 4)
        
        setViewControllers([todayNavController, gameNavController, appNavController, arcadeNavController, searchNavController], animated: false)
        
        tabBar.unselectedItemTintColor = .gray
        tabBar.barTintColor = .black
        
        modalPresentationStyle = .fullScreen
    }
}
