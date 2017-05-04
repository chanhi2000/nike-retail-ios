//
//  BuyButtonCell.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class BuyButtonCell: ButtonTVCell {
    
    override var feed: Any? {
        didSet {
            guard let item = feed as? Feed else {  return  }
            button.setTitle(String(format: "BUY $%.2f" , item.price), for: .normal)
        }
    }
    
    override func setupViews() {
        addSubview(button)
        button.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 12, leftConstant: 12, bottomConstant: 12, rightConstant: 12, widthConstant: 0, heightConstant: 40.5)
    }
}
