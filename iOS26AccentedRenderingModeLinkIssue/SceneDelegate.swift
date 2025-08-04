//
//  SceneDelegate.swift
//  iOS26AccentedRenderingModeLinkIssue
//
//  Created by Igor Palaguta on 04/08/2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let url = connectionOptions.urlContexts.first?.url else {
            return
        }

        handle(url, scene: scene)
    }

    func scene(_ scene: UIScene, openURLContexts urlContexts: Set<UIOpenURLContext>) {
        guard let url = urlContexts.first?.url else {
            return
        }

        handle(url, scene: scene)
    }

    private func handle(_ url: URL, scene: UIScene) {
        print("Received URL: \(url)")

        if let viewController = (scene as? UIWindowScene)?.windows.first?.rootViewController as? ViewController {
            viewController.url = url
        }
    }
}
