//
//  BpiHistoryParser.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

class BpiHistoryParser : Parser {
    func parse<BpiHistoryResponse>(data: Data) -> Response<BpiHistoryResponse> {
        
        
        return .failure(CoilDeskProviderError.notCorrectResponce)
    }
}
