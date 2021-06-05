//
//  UIViewController+Ext.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 05/06/2021.
//

import UIKit

extension UIViewController {
    /*
     let controller = UIAlertController(title: "Location Permission", message: "Please active your location from Settings ", preferredStyle: .alert)
     
     */
    func showPermissionAlert(title:String,message:String) {
        let controller = UIAlertController(title:title, message: message, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Open Settings", style: .default, handler: {(_) in
            guard let url = URL(string: UIApplication.openSettingsURLString),
                  UIApplication.shared.canOpenURL(url) else {
                return
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        controller.addAction(cancelAction)
        controller.addAction(settingsAction)
        self.present(controller, animated: true, completion: nil)
    }
    
    
    
    func showAlert(title:String , message:String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
//        let okAction = UIAlertAction(title: "Ok", style: .default, handler: {(_) in
//            self.dismiss(animated: true, completion: nil)
//        })
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
        controller.addAction(cancelAction)
//        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)
    }
    
    
    
    
    
}
/*
 let alert = UIAlertController(title: "Allow access to your photos",
 message: "This lets you share from your camera roll and enables other features for photos and videos. Go to your settings and tap \"Photos\".",
 preferredStyle: .alert)
 
 let notNowAction = UIAlertAction(title: "Not Now",
 style: .cancel,
 handler: nil)
 alert.addAction(notNowAction)
 
 let openSettingsAction = UIAlertAction(title: "Open Settings",
 style: .default) { [unowned self] (_) in
 // Open app privacy settings
 gotoAppPrivacySettings()
 }
 alert.addAction(openSettingsAction)
 
 present(alert, animated: true, completion: nil)
 */
