//
//  FeedCell.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class FeedCell: BaseCVCell {
    
    var feed: Any? {
        didSet {
            guard let item = feed as? Feed else {  return  }
            itemImageView.image = item.images[0]
            itemNameLabel.text = item.name
            itemPriceLabel.text = String(format: "$%.1f" , item.price)
        }
    }
    
    let itemImageView: UIImageView = {
        let imgv = UIImageView(image: #imageLiteral(resourceName: "s1"))
        imgv.contentMode = .scaleAspectFit
        imgv.clipsToBounds = true
        return imgv
    }()
    
    let itemNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "NIKE FREE RN FLKNIT 2017"
        lbl.font = defaultNameFont
        return lbl
    }()
    
    let itemPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "$120"
        lbl.font = defaultPriceFont
        return lbl
    }()
    
    override func setupViews() {
        addSubview(itemImageView)
        addSubview(itemNameLabel)
        addSubview(itemPriceLabel)
        
        itemImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: UIScreenWidth)
        itemNameLabel.anchor(itemImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 2, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        itemPriceLabel.anchor(itemNameLabel.bottomAnchor, left: itemNameLabel.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 2, leftConstant: 0, bottomConstant: 16, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
