//
//  ShoppingCartItemCell.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

// TODO - This is almost as same as FeedCell.  Remove redundancy
class ShoppingCartItemCell: BaseTVCell {
    
    var feed: Any? {
        didSet {
            guard let item = feed as? Feed else {  return  }
            productImageView.image = item.images[0]
            productNameLabel.text = item.name
            productPriceLabel.text = String(format: "$%.1f", item.price)
        }
    }
    
    let productImageView: UIImageView = {
        let imgv = UIImageView(image: #imageLiteral(resourceName: "f1"))
        imgv.contentMode = .scaleAspectFit
        imgv.clipsToBounds = true
        return imgv
    }()

    let productNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = NikeFont(isCondensed: true, style: .demiBold, size: 15).inUIFont()
        lbl.text = "TEST TEST TEST"
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let productPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = defaultDescriptionFont
        lbl.textColor = .darkGray
        lbl.text = "$120"
        return lbl
    }()
    
    let removeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("REMOVE", for: .normal)
        btn.titleLabel?.font = removeButtonFont
        btn.setTitleColor(.darkGray, for: .normal)
        return btn
    }()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func setupViews() {
        addSubview(productImageView)
        
        let stackView = UIStackView(arrangedSubviews: [
            productNameLabel, productPriceLabel, removeButton
            ])
        stackView.alignment = .leading // vertical aligned to leading edge
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        
        addSubview(stackView)
        
        
        productImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: stackView.leftAnchor, topConstant: 24, leftConstant: 24, bottomConstant: 0, rightConstant: 12, widthConstant: 96, heightConstant: 96)
        
        stackView.anchor(self.topAnchor, left: productImageView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 24, leftConstant: 12, bottomConstant: 24, rightConstant: 24, widthConstant: 0, heightConstant: 0)
        
        productNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20.5).isActive = true
    }
}

// TODO -- Dynamically Sized productNameLabel needed

