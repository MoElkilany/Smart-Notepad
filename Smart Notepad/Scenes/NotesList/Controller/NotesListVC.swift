//
//  NotesListVC.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 04/06/2021.
//

import UIKit
import CoreLocation

class NotesListVC: UIViewController {
    
    let locationManager = CLLocationManager()
    
    var lat = 0.0
    var lng = 0.0
    
    
    var mainView :NotesListView {
        return view as! NotesListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadActivity()
        title = "Notes"
    }
    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    
//       
//    }
}
