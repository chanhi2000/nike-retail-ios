//
//  BillingTItleCell.swift
//  nike-retail
//
//  Created by LeeChan on 5/3/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class BillingTitleCell: HeaderTVCell {

    override func setupViews() {
        headerLabel.text = "BILLING INFORMATION"
        addSubview(headerLabel)
        headerLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 24, leftConstant: 24, bottomConstant: 24, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
