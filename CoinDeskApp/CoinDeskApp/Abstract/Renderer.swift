//
//  Renderer.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 26/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import UIKit

class Renderer: UIView {
    
    public static func initialize(container: UIView) -> UIView? {
        let bundle = Bundle(for: Renderer.self)
        guard
            let views = bundle.loadNibNamed(getNibName(), owner: self, options:nil),
            !views.isEmpty,
            let view = views.first as? Renderer
        else {
            return nil
        }
        
        view.frame = container.frame
        container.addSubview(view)
        view.setup()
        return view;
    }
    
    internal static func getNibName() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    internal func setup() {
    }
}
