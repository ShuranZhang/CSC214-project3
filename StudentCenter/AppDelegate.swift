//
//  AppDelegate.swift
//  StudentCenter
//
//  Created by Shuran Zhang on 8/12/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let defaults = UserDefaults(suiteName: kAppGroupBundleID)!
    var dataFileName = "StdentCenterFile"
    var itemCollection: PhotoItem!
    var myMajor = Major()
    lazy var fileURL: URL = {
        let documentsDir =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDir.appendingPathComponent(dataFileName, isDirectory: false)
    }()

    override init() {
        defaults.set(Bundle.main.build, forKey: dAppVersion)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loadData()
        
        if let navController = window?.rootViewController as? UINavigationController {
            if let mainController = navController.viewControllers.first as? MainMenuController {
                print("here1")
                mainController.detailItem = itemCollection
              
            }
           
        }
        if let navController2 = window?.rootViewController as? UINavigationController {
            if let mainViewController2 = navController2.viewControllers.last as? RatingTableViewController {
                mainViewController2.myMajor = myMajor
            }
        }

        initDefaults()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("Resign Active")
        saveData()
        let numLaunches = defaults.integer(forKey: dNumLaunches) + 1
        defaults.set(numLaunches, forKey: dNumLaunches)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale.current
        let currentDate = Date()
        defaults.set(dateFormatter.string(from: currentDate), forKey: dAccessDate)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        saveData()
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        loadData()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
         print("Load something")
        loadData()
        
        if let navController = window?.rootViewController as? UINavigationController {
            if let mainController = navController.viewControllers.first as? MainMenuController {
                mainController.detailItem = itemCollection
            }
        }
        
        
        initDefaults()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        saveData()
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func initDefaults() {
        if let path = Bundle.main.path(forResource: "Defaults", ofType: "plist"),
            let dictionary = NSDictionary(contentsOfFile: path) {
            defaults.register(defaults: dictionary as! [String : Any])
            defaults.synchronize()
        }
    }
    func saveData() {
        print("save")
        NSKeyedArchiver.archiveRootObject(itemCollection, toFile: fileURL.path)
    }
    
    func loadData() {
        //print("load")
        if let items = NSKeyedUnarchiver.unarchiveObject(withFile: fileURL.path) as? PhotoItem {
            itemCollection = items
        } else {
            itemCollection = PhotoItem()
        }
    }
}

