//
//  Feed.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

struct Feed {
    let uid: String
    let name: String
    let images: [UIImage]
    let price: Double
    let description: String
    let detail: String
}

func fetchFeeds() -> [Feed] {
    let items: [Feed] = {
        var item1Images = [UIImage]()
        for i in 1...8 {
            item1Images.append(UIImage(named: "s\(i)")!)
        }
        let feed1 = Feed(uid: "875942-100", name: "NIKE AIR MAX 1 ULTRA 2.0 FLYKNIT", images: item1Images, price: 180, description: "LIGHTER THAN EVER! The Nike Air Max 1 Ultra 2.0 Flyknit Men's Shoe updates the iconic original with an ultra-lightweight upper while keeping the plush, time-tested Max Air cushioning.", detail: "LIGHTER THAN EVER! The Nike Air Max 1 Ultra 2.0 Flyknit Men's Shoe updates the iconic original with an ultra-lightweight upper while keeping the plush, time-tested Max Air cushioning.")
        
        var item2Images = [UIImage]()
        for i in 1...7 {
            item2Images.append(UIImage(named: "t\(i)")!)
        }
        let feed2 = Feed(uid: "880843-003", name: "NIKE FREE RN FLYKNIT 2017", images: item2Images, price: 120, description: "The Nike Free RN Flyknit 2017 Men's Running Shoe brings you miles of comfort with an exceptionally flexible outsole for the ultimate natural ride. Flyknit fabric wraps your foot for a snug, supportive fit while a tri-star outsole expands and flexes to let your foot move naturally.", detail: "The Nike Free RN Flyknit 2017 Men's Running Shoe brings you miles of comfort with an exceptionally flexible outsole for the ultimate natural ride. Flyknit fabric wraps your foot for a snug, supportive fit while a tri-star outsole expands and flexes to let your foot move naturally.")
        
        var item3Images = [UIImage]()
        for i in 1...6 {
            item3Images.append(UIImage(named: "j\(i)")!)
        }
        let feed3 = Feed(uid: "384664-113", name: "AIR JORDAN 6 RETRO", images: item3Images, price: 190, description: "The Air Jordan 6 Retro Men's Shoe celebrates a championship heritage with design lines and plush cushioning inspired by the ground-breaking hoops original.", detail: "The Air Jordan 6 Retro Men's Shoe celebrates a championship heritage with design lines and plush cushioning inspired by the ground-breaking hoops original.")
        
        var item4Images = [UIImage]()
        for i in 1...6 {
            item4Images.append(UIImage(named: "f\(i)")!)
        }
        let feed4 = Feed(uid: "805144-852", name: "TECH FLEECE WINDRUNNER", images: item4Images, price: 130, description: "The Nike Sportswear Tech Fleece Windrunner Men's Hoodie is redesigned for cooler weather with smooth, engineered fleece that offers lightweight warmth. Bonded seams lend a modern update to the classic chevron design.", detail: "The Nike Sportswear Tech Fleece Windrunner Men's Hoodie is redesigned for cooler weather with smooth, engineered fleece that offers lightweight warmth. Bonded seams lend a modern update to the classic chevron design.")
        
        return [feed1, feed2, feed3, feed4]
    }()
    
    return items
}
