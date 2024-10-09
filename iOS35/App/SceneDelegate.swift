//
//  SceneDelegate.swift
//  iOS35
//
//  Created by 우상욱 on 10/9/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: LoginViewController())
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}


