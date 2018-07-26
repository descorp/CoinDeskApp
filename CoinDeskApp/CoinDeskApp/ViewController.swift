//
//  ViewController.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var renderer: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.renderer = LoadingView.initialize(container: self.view)
    }

}

