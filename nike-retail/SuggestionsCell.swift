//
//  SuggestionCell.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class SuggestionsCell: BaseTVCell {
    
    let youMightAlsoLikeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "YOU MIGHT ALSO LIKE"
        lbl.font = NikeFont(isCondensed: true, style: .demiBold, size: 15).inUIFont()
        return lbl
    }()
    
    let suggestionCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
        cv.register(SuggestionCVCell.self, forCellWithReuseIdentifier: "SuggestionsCell")
        return cv
    }()
    
    override func setupViews() {
        addSubview(youMightAlsoLikeLabel)
        addSubview(suggestionCollectionView)
        
        youMightAlsoLikeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        youMightAlsoLikeLabel.anchor(topAnchor, left: nil, bottom: suggestionCollectionView.topAnchor, right: nil, topConstant: 24, leftConstant: 0, bottomConstant: 24, rightConstant: 0, widthConstant: 0, heightConstant: 0)        
        suggestionCollectionView.anchor(youMightAlsoLikeLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 24, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }

}
