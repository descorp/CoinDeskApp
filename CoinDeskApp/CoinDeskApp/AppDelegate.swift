//
//  AppDelegate.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import UIKit

struct AppDependency: Dependency, HasCoinDeskDataProvider, HasCacheStorage, HasSynchronizer {
    let dataProvider: CoinDeskDataProvider
    let cache: CacheStorage
    let synchronizer: Synchronizer
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configure(dependency: AppDependency())
        // Override point for customization after application launch.
        return true
    }

}

