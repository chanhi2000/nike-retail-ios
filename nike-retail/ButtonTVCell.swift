//
//  ButtonTVCell.swift
//  nike-retail
//
//  Created by LeeChan on 5/3/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class ButtonTVCell: BaseTVCell {

    var feed: Any?
    var title: Any? {
        didSet {
            guard let t = title as? String else {  return  }
            button.setTitle(t, for: .normal)
        }
    }
    
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("TEST $100 TEST", for: .normal)
        btn.titleLabel?.font = NikeFont(isCondensed: true, style: .demiBold, size: 15).inUIFont()
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 3
        btn.clipsToBounds = true
        btn.backgroundColor = .black
        return btn
    }()
}
