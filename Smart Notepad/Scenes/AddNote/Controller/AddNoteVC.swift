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
    
    var lat = 0.0
    var lng = 0.0
    var fullAddress = "" 
        var mainView: AddNoteView {
        return view as! AddNoteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadactivity()
    }
    
}
