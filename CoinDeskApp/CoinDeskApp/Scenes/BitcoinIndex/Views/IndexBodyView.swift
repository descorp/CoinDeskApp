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
    
    var data: [PriceIndexHistoryRecord]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    
    override func setup() {
        self.tableView.registerNib(type: PriceIndexHistoryRecordCellView.self)
        self.tableView.dataSource = self
    }
    
    public func updateWith(records: [PriceIndexHistoryRecord], timestamp: Date) {
        self.data = records.sorted(by: { (lhs, rhs) -> Bool in
            return lhs.date > rhs.date
        })
        self.tableView.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutSubviews()
    }
    
    override var intrinsicContentSize: CGSize {
        return self.tableView.contentSize
    }
}

extension IndexBodyView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(type: PriceIndexHistoryRecordCellView.self)
        let record = data![indexPath.item]
        cell.updateWith(date: record.date, value: record.value)
        return cell
    }
    
}
