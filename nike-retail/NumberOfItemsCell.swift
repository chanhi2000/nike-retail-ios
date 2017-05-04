//
//  NumberOfItemsCell.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class NumberOfItemsCell: HeaderTVCell {
    
    var itemTotal: Any? {
        didSet {
            guard let total = itemTotal as? Int else {  return  }
            headerLabel.text = "\(total) ITEMS"
        }
    }
    
    override func setupViews() {
        addSubview(headerLabel)
        headerLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 24, leftConstant: 24, bottomConstant: 24, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
