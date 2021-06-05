//
//  AddNoteVC.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 05/06/2021.
//

import UIKit
import CoreLocation

class AddNoteVC: UIViewController {

    let locationManager = CLLocationManager()
    var pickerImage = UIImagePickerController()
    var imageSelected = UIImage()
    var lat = 0.0
    var lng = 0.0
    var fullAddress = ""
    var isUserAccessPhoto = true
    let currentTime = Date()
    var  noteTime = Date()

        var mainView: AddNoteView {
        return view as! AddNoteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadactivity()
    }
    
}
