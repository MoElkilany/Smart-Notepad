//
//  Helper.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 05/06/2021.
//

import UIKit

class Helper {
    
    static var  userAcceptPermission = false
    static let shared = Helper()
    
  static  func chosseOptionAlert(imagePicker:UIImagePickerController, vc:UIViewController){
    let  alert = UIAlertController(title: "Choose Image", message: "Pick Image From", preferredStyle: .actionSheet)
        
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { (btn) in
           imagePicker.sourceType = .photoLibrary
            Helper.shared.confiugreGallaryOption(vc: vc)
        }
    
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (btn) in
            imagePicker.sourceType = .camera
            Helper.shared.confiugreCameraOptions(vc: vc)
        }
        
        let cancel  = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(galleryAction)
        alert.addAction(cameraAction)
        alert.addAction(cancel)
        vc.present(alert, animated: true, completion: nil )
    }
    
     func confiugreCameraOptions(vc:UIViewController){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            imagePicker.delegate = vc as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                vc.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func confiugreGallaryOption(vc:UIViewController){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
                imagePicker.delegate = vc as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            vc.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
}
