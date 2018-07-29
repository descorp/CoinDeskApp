//
//  LoadingView.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 26/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

class LoadingView: Renderer {
    
    @IBOutlet weak var label: UILabel!
    
    override func setup() {
        label.text = String.localize(key:"state.loading.title")
    }
}
