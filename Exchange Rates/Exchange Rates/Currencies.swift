//
//  Currencies.swift
//  Exchange Rates
//
//  Created by Artem Miklashevich on 6/11/18.
//  Copyright © 2018 Artem Miklashevych. All rights reserved.
//

import Foundation

struct Currence: Codable {
    let ccy: String
    let base_ccy: String
    let buy: String
    let sale: String
}
