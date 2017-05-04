//
//  ItemDetailCell.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class FeedDetailCell: BaseTVCell {
    
    var feed: Any? {
        didSet {
            guard let item = feed as? Feed else {  return  }
            itemNameLabel.text = item.name
            itemDescriptionLabel.text = item.description
        }
    }
    
    let itemNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "test test test"
        lbl.font = defaultNameFont
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let itemDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "test test test test test test test test test test test test test test test"
        lbl.numberOfLines = 5
        lbl.font = defaultDescriptionFont
        lbl.textColor = .darkGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func setupViews() {
        addSubview(itemNameLabel)
        addSubview(itemDescriptionLabel)
        
        itemNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        itemNameLabel.anchor(topAnchor, left: nil, bottom: itemDescriptionLabel.topAnchor, right: nil, topConstant: 36, leftConstant: 0, bottomConstant: 36, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        itemDescriptionLabel.anchor(itemNameLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 36, leftConstant: 24, bottomConstant: 36, rightConstant: 24, widthConstant: 0, heightConstant: 0)
        
    }
    
    
}
