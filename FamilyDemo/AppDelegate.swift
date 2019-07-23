//
//  AppDelegate.swift
//  FamilyDemo
//
//  Created by zzk on 2019/7/16.
//  Copyright © 2019 zzk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let nvc = UINavigationController(rootViewController: RootViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

}

