//
//  ProductDetailCell.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class ProductDetailCell: BaseTVCell {
    
    let productDetailsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "PRODUCT DETAILS"
        lbl.font = NikeFont(isCondensed: true, style: .demiBold, size: 15).inUIFont()
        return lbl
    }()
    
    override func setupViews() {
        accessoryType = .disclosureIndicator
        
        addSubview(productDetailsLabel)
        productDetailsLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 12, rightConstant: 0, widthConstant: 0, heightConstant: 40.5)
    }
    
    
}
