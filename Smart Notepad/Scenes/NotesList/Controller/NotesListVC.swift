//
//  NotesListVC.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 04/06/2021.
//

import UIKit
import CoreLocation
import RealmSwift

class NotesListVC: UIViewController {
    
    let locationManager = CLLocationManager()
    
    var lat = 0.0
    var lng = 0.0
    let realm = try! Realm()
    
    var mainView :NotesListView {
        return view as! NotesListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Realm File" , Realm.Configuration.defaultConfiguration.fileURL!)
        viewDidLoadActivity()
        title = "Notes"
    }
}
