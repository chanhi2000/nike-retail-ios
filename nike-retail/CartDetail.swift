//
//  CartCell.swift
//  nike-retail
//
//  Created by LeeChan on 5/3/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit
extension CartTotalCell {
    enum CartDetail: String {
        case Subtotal = "SUBTOTAL"
        case ExtraFee = "ESTIMATED SHIPPING & HANDLING"
        case Tax = "TAX"
        case Total = "TOTAL"
    }
}

extension CartDetailCell {
    enum CartDetail: String {
        case Subtotal = "SUBTOTAL"
        case ExtraFee = "ESTIMATED SHIPPING & HANDLING"
        case Tax = "TAX"
        case Total = "TOTAL"
    }
}
