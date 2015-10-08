//
//  AppDelegate.swift
//  EFZoomHeaderTableView
//
//  Created by Eddie Fu on 10/4/15.
//  Copyright © 2015 Eddie Fu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tableVC: ViewController = ViewController()
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        if let window = window {
            window.backgroundColor = UIColor.whiteColor()
            window.rootViewController = tableVC
            window.makeKeyAndVisible()
        }
        return true
    }
}

