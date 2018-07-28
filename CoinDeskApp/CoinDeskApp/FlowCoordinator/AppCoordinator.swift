//
//  AppCoordinator.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 28/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

struct AppDependency: HasIndexDataProvider, HasCacheStorage, HasSynchronizer {
    
    let cache: CacheStorage
    let synchronizer: Synchronizer
    let indexDataProvider: IndexDataProvider
}

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow?
    let dependency: AppDependency
    
    // MARK: - Coordinator
    init(window: UIWindow) {
        self.window = window
        let cache = CacheStorageService()
        let syncService = SyncService()
        let indexDataProvider = CoinDeskService(synchronizer: syncService, cache: cache)
        self.dependency = AppDependency(cache: cache,
                                        synchronizer: syncService,
                                        indexDataProvider: indexDataProvider)
        super.init(withViewController: UINavigationController())
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func start() {
        let rootCoordinator = BitcoinIndexCoordinator(withViewController: self.rootViewController, parentCoordinator: self, dependency: dependency)
        rootCoordinator.start()
        self.childCoordinators.append(rootCoordinator)
    }
    
    override func finish() {
        
    }
    
}
