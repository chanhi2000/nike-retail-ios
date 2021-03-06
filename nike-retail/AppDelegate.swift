//
//  AppDelegate.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

let UIScreenWidth = UIScreen.main.bounds.width
let defaultNameFont = UIFont(name: "AvenirNextCondensed-Medium", size: 17)
let defaultPriceFont = UIFont(name: "AvenirNext-Regular", size: 13)
let ANR15Font = UIFont(name: "AvenirNext-Regular", size: 15)
let defaultDescriptionFont = UIFont(name: "AvenirNext-Regular", size: 12)
let removeButtonFont = UIFont(name: "AvenirNext-Medium", size: 12)
let ANDB15Font = UIFont(name: "AvenirNext-DemiBold", size: 15)
let navigationTitleFont = UIFont(name: "AvenirNextCondensed-DemiBold", size: 17)
let defaultHeaderCellFont = UIFont(name: "AvenirNextCondensed-DemiBold", size: 19)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
//        window?.rootViewController = ImagesPageViewController()
        window?.rootViewController = TabBarController()
        
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: navigationTitleFont!]
        
        UITabBar.appearance().tintColor = .black
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

