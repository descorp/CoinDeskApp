//
//  TableViewExtensions.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 29/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerNib<T: UITableViewCell>(type: T.Type) {
        let name = NSStringFromClass(T.self).components(separatedBy: ".").last!
        let nib = UINib(nibName: name, bundle: Bundle(for: T.self))
        self.register(nib, forCellReuseIdentifier: name)
    }
    
    func registerClass<T: UITableViewCell>(type: T.Type) {
        let name = NSStringFromClass(T.self).components(separatedBy: ".").last!
        self.register(T.self, forCellReuseIdentifier: name)
    }
    
    func deque<T: UITableViewCell>(type: T.Type) -> T {
        let name = NSStringFromClass(T.self).components(separatedBy: ".").last!
        return self.dequeueReusableCell(withIdentifier: name) as! T
    }
}
