//
//  Dependency.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 26/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

protocol Dependency {}

/// The singleton dependency container reference
/// which can be reassigned to another container
struct DependencyInjector {
    static var dependencies: Dependency!
    private init() { }
}

/// Attach to any type for exposing the dependency container
protocol HasDependencies {
    var dependencies: Dependency { get }
}

extension HasDependencies {
    
    /// Container for dependency instance factories
    var dependencies: Dependency {
        return DependencyInjector.dependencies
    }
}

extension UIApplicationDelegate {
    
    func configure(dependency: Dependency) {
        DependencyInjector.dependencies = dependency
    }
}
