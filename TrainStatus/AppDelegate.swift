//
//  AppDelegate.swift
//  TrainStatus
//
//  Created by Brad Moore on 10/31/18.
//  Copyright © 2018 Brad Moore. All rights reserved.
//

import UIKit
import os
import AmtrakStatus

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.        
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
        let mainController = self.window!.rootViewController as! ViewController
        mainController.timeLabel.text = "Loading..."
        
        let currentDate = Date()
        let day = Calendar.current.component(.day, from: currentDate)
        let month = Calendar.current.component(.month, from: currentDate)
        let year = Calendar.current.component(.year, from: currentDate)
        
        let request = RequestFactory.newRequest(day: day, month: month, year: year)!
        
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: dataCallback)
        // set a delegate here so that redirects don't go to a http:// URL and violate security policy
        dataTask.resume()
    }
    
    func dataCallback(data: Data?, response: URLResponse?, error: Error?) -> Void {
        let parsedData = ResponseParser.parse(body: String(data: data!, encoding: String.Encoding.utf8)!)
        os_log("Got %@", parsedData)
        DispatchQueue.main.async {
            let mainController = self.window!.rootViewController as! ViewController
            mainController.timeLabel.text = parsedData
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

