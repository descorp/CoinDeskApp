//
//  IndexBodyView.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 29/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit
import Common

class IndexBodyView: Renderer {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func setup() {
        
    }
    
    public func updateWith(index: [PriceIndexHistoryRecord], timestamp: Date) {
        
    }
    
    override var intrinsicContentSize: CGSize {
        return tableView.contentSize
    }
}
