//
//  UIViewController+Ext.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 05/06/2021.
//

import UIKit

extension UIViewController {
    
    func showLocationPermissionAlert() {
            let controller = UIAlertController(title: "Location Permission", message: "Please enable active location to get your current location", preferredStyle: .alert)
        
            let settingsAction = UIAlertAction(title: "Settings", style: .default, handler: {(cAlertAction) in
                UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
            })
        
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        controller.addAction(cancelAction)
        controller.addAction(settingsAction)
            self.present(controller, animated: true, completion: nil)
    }
    
    
    
    func showAlert(title:String , message:String) {
            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: {(_) in
                self.dismiss(animated: true, completion: nil)
            })
        
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            controller.addAction(cancelAction)
            controller.addAction(okAction)
            self.present(controller, animated: true, completion: nil)
    }
    
}
