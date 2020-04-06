//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Ben Saratikyan on 3/24/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel: Decodable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}

