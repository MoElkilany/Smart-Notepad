//
//  NotesListVC+Function.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 04/06/2021.
//

import UIKit
import CoreLocation

extension NotesListVC {
    
    func viewDidLoadActivity(){
        setUpView()
        tableConfigration()
    }
    
    func setUpView(){
        locationAuthorization()
        
     
        
        
        mainView.addNoteBtn.layer.cornerRadius = 10
        mainView.addNoteBtn.layer.borderWidth = 1
        mainView.addNoteBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    func tableConfigration(){
        mainView.myNotesTable.register(UINib(nibName: MyNotesCell.cellID, bundle: nil), forCellReuseIdentifier:  MyNotesCell.cellID)
        mainView.myNotesTable.delegate = self
        mainView.myNotesTable.dataSource = self
        mainView.myNotesTable.showsVerticalScrollIndicator = false
        mainView.myNotesTable.showsHorizontalScrollIndicator = false
    }
    
    func locationAuthorization(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
}



extension NotesListVC : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(location.latitude) \(location.longitude)")

        self.lat = location.latitude
        self.lng = location.longitude
        self.locationManager.startUpdatingLocation()
    }
    
}
