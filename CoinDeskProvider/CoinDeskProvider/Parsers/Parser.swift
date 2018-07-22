//
//  Parser.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

protocol Parser {
    func parse<T>(data: Data) -> Response<T>
}
