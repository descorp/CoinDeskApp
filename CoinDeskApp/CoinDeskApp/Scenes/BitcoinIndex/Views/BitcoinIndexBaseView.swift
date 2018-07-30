//
//  BitcoinIndexBaseView.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 29/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

protocol LoadingDelegate: class {
    func reloadRequested()
}

class BitcoinIndexBaseView : Renderer {
    
    public weak var delegate: LoadingDelegate?
    
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var bodyContainer: UIView!
    @IBOutlet weak var footerLabel: UITextView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var pullToRefresh: UIRefreshControl!
    
    override func setup() {
        setupScrollView()
        setupHeader()
        setupBody()
        setupFooter()
    }
    
    func loadDidStarted() {
        self.pullToRefresh.beginRefreshing()
    }
    
    func loadDidFinished() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.pullToRefresh.endRefreshing()
        }
    }
    
    @objc internal func refreshDidTriggered(control: UIRefreshControl) {
        guard
            let delegate = self.delegate
        else {
            self.loadDidFinished()
            return
        }
        
        delegate.reloadRequested()
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
        self.pullToRefresh = UIRefreshControl()
        pullToRefresh.attributedTitle = NSAttributedString(string: String.localize(key: "scene.bitcoinindex.pullToRefresh.title"))
        pullToRefresh.addTarget(self, action: #selector(refreshDidTriggered(control:)), for: UIControlEvents.valueChanged)
        self.scrollView.insertSubview(pullToRefresh, at: 0)
    }
}
