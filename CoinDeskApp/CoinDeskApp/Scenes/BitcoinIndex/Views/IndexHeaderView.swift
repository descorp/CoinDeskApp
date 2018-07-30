//
//  IndexHeaderView.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 27/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import Common

class IndexHeaderView: Renderer {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueTitle: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    public func updateWith(index: PriceIndex, timestamp: Date) {
        titleLabel.text = String(format: String.localize(key:"scene.bitcoinindex.title"),
                                 index.code.uppercased())
        valueTitle.text = index.rate.description
        timestampLabel.text = timestamp.formar("YYYY-MM-dd hh:mm:ss")
    }
}
