//
//  ViewController.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import UIKit
import CoinDeskProvider
import Common

class BitcoinIndexViewController: BaseViewController {
    
    typealias Dependency = HasIndexDataProvider
    
    let dependency: Dependency
    let currency = "EUR"
    
    init(dependency: Dependency) {        
        self.dependency = dependency
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = self.render(type: LoadingView.self, in: self.view)
        
        var indexData: (index: [PriceIndex]?, timestamp: Date?, error: Error?)?
        var indexHistoryData: (history: [PriceIndexHistoryRecord]?, timestamp: Date?, error: Error?)?
        
        let taskGroup = DispatchGroup()
        taskGroup.enter()
        self.dependency.indexDataProvider.getIndex(currency: currency) { result in
            switch result {
            case .data(let index, let timestamp):
                indexData = (index, timestamp, nil)
            case .error(let error):
                indexData = (nil, nil, error)
            }
            taskGroup.leave()
        }
        
        taskGroup.enter()
        let from = Date()
        let to = Date()
        self.dependency.indexDataProvider.getIndexHistory(from: from, to: to, currency: currency) { result in
            switch result {
            case .data(let history, let timestamp):
                indexHistoryData = (history, timestamp, nil)
            case .error(let error):
                indexHistoryData = (nil, nil, error)
            }
            taskGroup.leave()
        }
        
        taskGroup.notify(queue: DispatchQueue.main) { [weak self] in
            guard
                let localSelf = self
            else { return }
            
            guard
                let index = indexData?.index,
                let indexTimestamp = indexData?.timestamp,
                let history = indexHistoryData?.history,
                let historyTimestamp = indexHistoryData?.timestamp
            else {
                let _ = localSelf.render(type: OfflineModeView.self, in: localSelf.view)
                return
            }
            
            let base = localSelf.render(type: BitcoinIndexBaseView.self, in: localSelf.view)
            let header = localSelf.render(type: IndexHeaderView.self, in: base.headerContainer)
            header.updateWith(index: index[1], timestamp: indexTimestamp)
            
            let body = localSelf.render(type: IndexBodyView.self, in: base.bodyContainer)
            body.updateWith(records: history, timestamp: historyTimestamp)
        }
        

    }

}

