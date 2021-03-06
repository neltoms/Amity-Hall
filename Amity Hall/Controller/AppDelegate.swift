//
//  AppDelegate.swift
//  Amity Hall
//
//  Created by Nel Toms on 8/2/18.
//  Copyright © 2018 Parko Inc. All rights reserved.
//

import UIKit
import Parse
import Bolts
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        
//        // Override point for customization after application launch.
//        let configuration = ParseClientConfiguration {
//            $0.applicationId = "MU1wSTDdV1xeU4PsfNfZFr2WXQksRoRU2wTFNRpC"
//            $0.clientKey = "2XlLk9MpTp6pMvHbcPSH7ymf3SpnMcjTIh4JdTC1"
//            $0.server = "https://parseapi.back4app.com"
//            $0.isLocalDatastoreEnabled = false // If you need to enable local data store
//        }
//        Parse.initialize(with: configuration)
//
//        let userName:String? = UserDefaults.standard.string(forKey: "user_name")
//
//        if (userName != nil) {
//
//            // Navigat to Protected page
//            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//
//            var mainPage:UserViewController = mainStoryBoard.instantiateInitialViewController() as! UserViewController
//
//            var mainPageNav = UINavigationController(rootViewController: mainPage)
//
//            var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//
//            appDelegate.window?.rootViewController = mainPageNav
//        }
        
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
//    func saveInstallationObject(){
//        if let installation = PFInstallation.current(){
//            installation.saveInBackground {
//                (success: Bool, error: Error?) in
//                if (success) {
//                    print("You have successfully connected your app to Back4App!")
//                } else {
//                    if let myError = error{
//                        print(myError.localizedDescription)
//                    }else{
//                        print("Uknown error")
//                    }
//                }
//            }
//        }
//    }


}

