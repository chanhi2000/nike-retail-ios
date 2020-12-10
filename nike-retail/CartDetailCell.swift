//
//  CartDetailCell.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class CartDetailCell: BaseStackViewTVCell {
    
    var subtotal: Double = 0.0 {
        didSet {
            subtotalPriceLabel.text = String(format: "$%.2f", subtotal)
            tax = subtotal * 0.1
        }
    }
    
    var tax: Double = 0.0 {
        didSet {
            taxPriceLabel.text = String(format: "$%.2f", tax)
        }
    }
    
    let subtotalPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = NikeFont(isCondensed: false, style: .regular, size: 15).inUIFont()
        lbl.textColor = .darkGray
        lbl.textAlignment = .right
        return lbl
    }()
    
    let extraFeePriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = NikeFont(isCondensed: false, style: .regular, size: 15).inUIFont()
        lbl.textColor = .darkGray
        lbl.textAlignment = .right
        lbl.text = "FREE"
        return lbl
    }()
    
    let taxPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = NikeFont(isCondensed: false, style: .regular, size: 15).inUIFont()
        lbl.textColor = .darkGray
        lbl.textAlignment = .right
        return lbl
    }()
    
    override func setupViews() {
        let subtotalStackView = generateStackView(with: CartDetail.Subtotal.rawValue, priceLabel: subtotalPriceLabel)
        let extraFeeStackView = generateStackView(with: CartDetail.ExtraFee.rawValue, priceLabel: extraFeePriceLabel)
        let taxStackView = generateStackView(with: CartDetail.Tax.rawValue, priceLabel: taxPriceLabel)
        
        addSubview(subtotalStackView)
        addSubview(extraFeeStackView)
        addSubview(taxStackView)
        
        subtotalStackView.anchor(self.topAnchor, left: self.leftAnchor, bottom: extraFeeStackView.topAnchor, right: self.rightAnchor, topConstant: 24, leftConstant: 24, bottomConstant: 2, rightConstant: 24, widthConstant: 0, heightConstant: 0)
        extraFeeStackView.anchor(subtotalStackView.bottomAnchor, left: self.leftAnchor, bottom: taxStackView.topAnchor, right: self.rightAnchor, topConstant: 2, leftConstant: 24, bottomConstant: 2, rightConstant: 24, widthConstant: 0, heightConstant: 0)
        taxStackView.anchor(extraFeeStackView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 2, leftConstant: 24, bottomConstant: 24, rightConstant: 24, widthConstant: 0, heightConstant: 0)
    }
}
