//
//  CartTotalCell.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class CartTotalCell: BaseStackViewTVCell {

    var total: Double = 0.0 {
        didSet {
            totalPriceLabel.text = String(format: "$%.2f", total)
        }
    }
    
    let totalPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = NikeFont(isCondensed: false, style: .demiBold, size: 15).inUIFont()
        lbl.textAlignment = .right
        return lbl
    }()
    
    override func setupViews() {
        let totalStackView = generateStackView(with: CartDetail.Total.rawValue, priceLabel: totalPriceLabel)
        addSubview(totalStackView)
        totalStackView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 24, leftConstant: 24, bottomConstant: 24, rightConstant: 24, widthConstant: 0, heightConstant: 0)
    }

}
