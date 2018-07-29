//
//  OfflineModeView.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 26/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

class OfflineModeView : Renderer {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
 
    override func setup() {
        titleLabel.text = String.localize(key:"state.error.offline.title")
        subtitleLabel.text = String.localize(key:"state.error.offline.subtitle")
    }
}
