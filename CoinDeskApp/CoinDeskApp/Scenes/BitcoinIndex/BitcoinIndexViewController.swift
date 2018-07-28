//
//  ViewController.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import UIKit
import CoinDeskProvider

class BitcoinIndexViewController: BaseViewController {
    
    typealias Dependency = HasIndexDataProvider
    
    let dependency: Dependency
    
    var renderer: UIView?
    
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
        
        self.dependency.indexDataProvider.getIndex { [weak self] result in
            guard
                let localSelf = self
            else { return }
            
            switch result {
            case .data(let index, let timestamp):
                guard
                    let header = IndexHeaderView.initialize(container: localSelf.view) as? IndexHeaderView
                else { return }
                
                header.updateWith(index: index, timestamp: timestamp)
                localSelf.renderer = header
            case .noData:
                localSelf.renderer = OfflineModeView.initialize(container: localSelf.view)
            case .error(_):
                localSelf.renderer = OfflineModeView.initialize(container: localSelf.view)
                return
            }
        }
    }

}

