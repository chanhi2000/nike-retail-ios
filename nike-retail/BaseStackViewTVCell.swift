//
//  BaseStackViewTVCell.swift
//  nike-retail
//
//  Created by LeeChan on 5/4/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class BaseStackViewTVCell: BaseTVCell {
    // Child class: BillingINfoCell,  CartCell
    func generateUILabel(with font: UIFont, text: String, aligned: NSTextAlignment = .left) -> UILabel {
        let lbl = UILabel()
        lbl.font = font
        lbl.text = text
        lbl.textAlignment = aligned
        return lbl
    }
    
    func generateUITextField(with font: UIFont, placeholder: String, aligned: NSTextAlignment = .left) -> UITextField {
        let txtf = UITextField()
        txtf.font = font
        txtf.placeholder = placeholder
        txtf.textAlignment = aligned
        return txtf
    }
    
    func generateStackView(with title: String, priceLabel: UILabel) -> UIStackView {
        let titleLabel = generateUILabel(with: navigationTitleFont!, text: title)
        let stackView = UIStackView(arrangedSubviews: [titleLabel, priceLabel])
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }
    
    func generateStackView(with title: String, textField: UITextField) -> UIStackView {
        let titleFont = NikeFont(isCondensed: false, style: .medium, size: 14).inUIFont()
        let titleLabel = generateUILabel(with: titleFont, text: title)
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textField])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }
}
