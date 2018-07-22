//
//  BpiParser.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

class BpiParser : Parser {
    func parse<BpiResponse>(data: Data) -> Response<BpiResponse> {
        let jsonString = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        
        return .failure(CoilDeskProviderError.notCorrectResponce)
    }
}
