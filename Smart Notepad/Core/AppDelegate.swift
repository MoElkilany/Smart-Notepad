//
//  AppDelegate.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 04/06/2021.
//

import UIKit
import CoreLocation

import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let splashNC  = UINavigationController(rootViewController:NotesListVC())
        window.rootViewController = splashNC
        window.makeKeyAndVisible()
        self.window = window

        IQKeyboardManager.shared.enable  = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        hasLocationPermission()
        return true
    }
    
    
    func hasLocationPermission()  {
        let locationManager = CLLocationManager()
        
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
            
            case .notDetermined, .restricted, .denied:
                Helper.userAcceptPermission = false
                print("hasLocationPermission2 ", Helper.userAcceptPermission)
            case .authorizedAlways, .authorizedWhenInUse:
                Helper.userAcceptPermission = true
                print("hasLocationPermission3", Helper.userAcceptPermission)
             default:
                    break
            }
        } else {
            Helper.userAcceptPermission = false
        }
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

