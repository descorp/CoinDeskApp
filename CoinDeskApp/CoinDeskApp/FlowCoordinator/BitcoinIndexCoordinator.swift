//
//  BitcoinIndexCoordinator.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 28/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

class BitcoinIndexCoordinator: Coordinator {
    
    typealias Dependency = HasIndexDataProvider
    
    let dependency: Dependency
    
    init(withViewController viewController: UIViewController,
         parentCoordinator coordinator: Coordinator?,
         dependency: Dependency) {
        self.dependency = dependency
        super.init(withViewController: viewController, andParentCoordinator: coordinator)
    }
    
    override func start() {
        guard
            let navigationController =  (rootViewController as? UINavigationController)
            else { return }
        
        let viewController: BitcoinIndexViewController = BitcoinIndexViewController(dependency: dependency)
        navigationController.setViewControllers([viewController], animated: false)
    }
}
