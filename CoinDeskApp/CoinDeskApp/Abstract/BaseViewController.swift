//
//  BaseViewController.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 28/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    public func render<T:Renderer>(type: T.Type, in container:UIView, animate: Bool = false) -> T {
        return T.initialize(container: container) as! T
    }
    
}
