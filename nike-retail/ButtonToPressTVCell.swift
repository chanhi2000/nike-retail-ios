//
//  CheckoutButtonCell.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class ButtonToPressTVCell: ButtonTVCell {
    
    weak var nvc: UINavigationController?
    
    var tempNumber: Double = 0.0
    
    override func setupViews() {
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addSubview(button)
        button.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 12, leftConstant: 12, bottomConstant: 12, rightConstant: 12, widthConstant: 0, heightConstant: 40.5)
        backgroundColor = .clear
    }
    
    func buttonPressed() {
        let vc = CheckoutTableViewController()
        vc.subtotal = tempNumber
        nvc?.pushViewController(vc, animated: true)
        // need to decide what happen when submit button is pressed
    }

}
