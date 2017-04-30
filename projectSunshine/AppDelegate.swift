//
//  AppDelegate.swift
//  projectSunshine
//
//  Created by Iulia Baltoi on 29/04/2017.
//  Copyright © 2017 Iulia Baltoi. All rights reserved.
//

import UIKit
import GoogleMaps


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.configureGoogleMaps()
        
        return true
    }
    
    func configureGoogleMaps() {
        GMSServices.provideAPIKey("AIzaSyBDTeraQ2ZqSYdsbnXJPqI41HLTUGOA7LI")
    }
}

