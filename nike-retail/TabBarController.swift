//
//  TabBarController.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationController = UINavigationController(rootViewController: FeedCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        navigationController.tabBarItem.image = UIImage(named: "icon-home")
        navigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
        let secondNavigationController = UINavigationController(rootViewController: UIViewController())
        secondNavigationController.tabBarItem.image = UIImage(named: "icon-nike")
        secondNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        secondNavigationController.tabBarItem.badgeValue = "2"
        
        let thirdNavigationController = UINavigationController(rootViewController: UIViewController())
        thirdNavigationController.tabBarItem.image = UIImage(named: "icon-plus")
        thirdNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
        let fourthNavigationController = UINavigationController(rootViewController: ShoppingBagTableViewController())
        fourthNavigationController.tabBarItem.image = UIImage(named: "icon-bag")
        fourthNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
        viewControllers = [navigationController, secondNavigationController, thirdNavigationController, fourthNavigationController]
        
        tabBar.isTranslucent = true
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
