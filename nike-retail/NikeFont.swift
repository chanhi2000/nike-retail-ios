//
//  DefaultFonts.swift
//  nike-retail
//
//  Created by LeeChan on 5/4/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

struct NikeFont {
    var isCondensed: Bool = false
    var style: fontStyle
    var size: CGFloat
    
    enum fontStyle: String {
        case regular = "Regular"
        case demiBold = "DemiBold"
        case medium = "Medium"
    }
    
    func inUIFont() -> UIFont {
        if isCondensed {
            return UIFont(name: "AvenirNextCondensed-\(style.rawValue)", size: size)!
        } else {
            return UIFont(name: "AvenirNext-\(style.rawValue)", size: size)!
        }
    }
}
