//
//  BitcoinIndexBaseView.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 29/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

class BitcoinIndexBaseView : Renderer {
    
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var bodyContainer: UIView!
    @IBOutlet weak var footerLabel: UITextView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func setup() {
        setupScrollView()
        setupHeader()
        setupBody()
        setupFooter()
    }
    
    @objc func refreshDidTriggered(control: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            control.endRefreshing()
        }
    }
    
    fileprivate func setupHeader() {
        headerContainer.layer.cornerRadius = 5
        headerContainer.layer.borderColor = UIColor.lightGray.cgColor
        headerContainer.layer.borderWidth = 1.0
    }
    
    fileprivate func setupBody() {
        
    }

    fileprivate func setupFooter() {
        footerLabel.isEditable = false
        footerLabel.dataDetectorTypes = .link
        let footer = NSMutableAttributedString(string: String.localize(key: "scene.bitcoinindex.footer"))
        footer.addAttribute(.link,
                            value: "https://www.coindesk.com/price/",
                            range: NSRange(location: footer.length - 8, length: 8) )
        footerLabel.attributedText = footer
    }
    
    fileprivate func setupScrollView() {
        let pullToRefresh = UIRefreshControl()
        pullToRefresh.attributedTitle = NSAttributedString(string: String.localize(key: "scene.bitcoinindex.pullToRefresh.title"))
        pullToRefresh.addTarget(self, action: #selector(refreshDidTriggered(control:)), for: UIControlEvents.valueChanged)
        self.scrollView.insertSubview(pullToRefresh, at: 0)
    }
}
