//
//  BillingInfoCell.swift
//  nike-retail
//
//  Created by LeeChan on 5/4/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class BillingInfoCell: BaseStackViewTVCell {

    enum BillingInfo: String {
        case Email = "Email Address"
        case CardNumber = "Card Number"
        case ExpirationDate = "Expiration Date"
        case SecurityCode = "Security Code"
    }
    
    let emailAddrTextField: UITextField = {
        let txtf = UITextField()
        txtf.font = NikeFont(isCondensed: false, style: .regular, size: 16).inUIFont()
        txtf.placeholder = "support@nike.com"
        txtf.borderStyle = .line
        txtf.textAlignment = .left
        txtf.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return txtf
    }()
    
    let cardNumTextField: UITextField = {
        let txtf = UITextField()
        txtf.font = NikeFont(isCondensed: false, style: .regular, size: 16).inUIFont()
        txtf.placeholder = "1234-5678-1234-5678"
        txtf.borderStyle = .line
        txtf.textAlignment = .left
        txtf.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return txtf
    }()
    
    let expDateTextField: UITextField = {
        let txtf = UITextField()
        txtf.font = NikeFont(isCondensed: false, style: .regular, size: 16).inUIFont()
        txtf.placeholder = "MM/YY"
        txtf.borderStyle = .line
        txtf.textAlignment = .left
        txtf.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return txtf
    }()
    
    let securityCodeTextField: UITextField = {
        let txtf = UITextField()
        txtf.font = NikeFont(isCondensed: false, style: .regular, size: 16).inUIFont()
        txtf.placeholder = "CVC"
        txtf.borderStyle = .line
        txtf.textAlignment = .left
        txtf.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return txtf
    }()
    
    override func setupViews() {
        let emailAddrStackView = generateStackView(with: BillingInfo.Email.rawValue, textField: emailAddrTextField)
        let cardNumStackView = generateStackView(with: BillingInfo.CardNumber.rawValue, textField: cardNumTextField)
        let expDateStackView = generateStackView(with: BillingInfo.ExpirationDate.rawValue, textField: expDateTextField)
        let securityCodeStackView = generateStackView(with: BillingInfo.SecurityCode.rawValue, textField: securityCodeTextField)
        addSubview(emailAddrStackView)
        addSubview(cardNumStackView)
        addSubview(expDateStackView)
        addSubview(securityCodeStackView)
        
        emailAddrStackView.anchor(self.topAnchor, left: self.leftAnchor, bottom: cardNumStackView.topAnchor, right: self.rightAnchor, topConstant: 24, leftConstant: 24, bottomConstant: 24, rightConstant: 24, widthConstant: 0, heightConstant: 0)
        cardNumStackView.anchor(emailAddrStackView.bottomAnchor, left: self.leftAnchor, bottom: expDateStackView.topAnchor, right: self.rightAnchor, topConstant: 24, leftConstant: 24, bottomConstant: 24, rightConstant: 24, widthConstant: 0, heightConstant: 0)
        expDateStackView.anchor(cardNumStackView.bottomAnchor, left: self.leftAnchor, bottom: securityCodeStackView.topAnchor, right: self.rightAnchor, topConstant: 24, leftConstant: 24, bottomConstant: 24, rightConstant: 24, widthConstant: 0, heightConstant: 0)
        securityCodeStackView.anchor(expDateStackView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 24, leftConstant: 24, bottomConstant: 24, rightConstant: 24, widthConstant: 0, heightConstant: 0)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
