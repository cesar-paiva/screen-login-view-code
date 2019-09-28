//
//  AppDelegate.swift
//  ViewCodeApp
//
//  Created by Cesar Paiva on 22/06/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let loginViewController = LoginViewController()
        window?.rootViewController = loginViewController
        window?.makeKeyAndVisible()
        return true
    }


}

