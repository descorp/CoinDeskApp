//
//  AppDelegate.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import UIKit

struct AppDependency: Dependency, HasIndexDataProvider, HasCacheStorage, HasSynchronizer {
    
    let cache: CacheStorage
    let synchronizer: Synchronizer
    let indexDataProvider: IndexDataProvider
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let cache = CacheStorageService()
        let syncService = SyncService()
        let indexDataProvider = CoinDeskService(synchronizer: syncService, cache: cache)
        configure(dependency: AppDependency(cache: cache,
                                            synchronizer: syncService,
                                            indexDataProvider: indexDataProvider))
        // Override point for customization after application launch.
        return true
    }

}

