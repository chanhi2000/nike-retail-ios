//
//  SuggestionCVCell.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class SuggestionCVCell: BaseCVCell {
    
    let suggestionImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.backgroundColor = .lightGray
        imgV.contentMode = .scaleAspectFill
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    var image: UIImage! {
        didSet {
            suggestionImageView.image = image
            setNeedsLayout()
        }
    }
    
    override func setupViews() {
        addSubview(suggestionImageView)
        
        suggestionImageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }

}
