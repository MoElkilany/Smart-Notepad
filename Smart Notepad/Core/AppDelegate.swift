//
//  AppDelegate.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 04/06/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let splashNC  = UINavigationController(rootViewController:HomeViewController())
        splashNC.navigationBar.backgroundColor  = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        splashNC.navigationBar.barTintColor = UIColor.white
        let navigationBar = splashNC.navigationBar
        navigationBar.setBackgroundImage(UIImage(named: ""),for: .default)
        navigationBar.shadowImage = UIImage()
        window.rootViewController = splashNC
        window.makeKeyAndVisible()
        
        self.window = window
      /*
         splashNC.navigationBar.backgroundColor  = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
         splashNC.navigationBar.barTintColor = UIColor.white
         let navigationBar = splashNC.navigationBar
         navigationBar.setBackgroundImage(UIImage(named: ""),for: .default)
         navigationBar.shadowImage = UIImage()
        window  = UIWindow(frame: UIScreen.main.bounds)

         window?.rootViewController = splashNC
         
         */
       
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
