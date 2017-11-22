//
//  AppDelegate.swift
//  Localization
//
//  Created by Anas Alhasani on 11/22/17.
//  Copyright © 2017 Anas Alhasani. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().isTranslucent = false
        
        Localizer.shared.setupInterfaceLayoutDirection()
        
        return true
    }
}

