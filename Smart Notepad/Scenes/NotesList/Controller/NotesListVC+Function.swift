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
        actionButtons()
        locationAuthorization()
        hasLocationPermission()
        
    }
    
    
func getMyNotesFromRealmData(){
    do {
        myNotes =  realm.objects(NotesModel.self)
        mainView.myNotesTable.reloadData()
        if myNotes.isEmpty {
            mainView.addNoteStack.isHidden = false
            mainView.myNotesTable.isHidden = true
        }else{
            mainView.addNoteStack.isHidden = true
            mainView.myNotesTable.isHidden = false
        }
    }
}
    
    
    func setUpView(){
       
        mainView.addNoteBtn.layer.cornerRadius = 10
        mainView.addNoteBtn.layer.borderWidth = 1
        mainView.addNoteBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    func actionButtons(){
        addNoteNavgationButton()
        mainView.addNoteBtn.addTarget(self, action: #selector(addNoteBtnTapped), for: .touchUpInside)
    }
    
    
    func addNoteNavgationButton(){
        let addNoteNavgationBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNoteBtnTapped))
        navigationItem.rightBarButtonItem = addNoteNavgationBtn
    }
    
    
    @objc func addNoteBtnTapped(){
        print("")
        self.navigationController?.pushViewController(AddNoteVC(), animated: true)
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
    
    func hasLocationPermission()  {
       
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
            case .notDetermined, .restricted, .denied:
                Helper.userAcceptPermission = false
                
            case .authorizedAlways, .authorizedWhenInUse:
                Helper.userAcceptPermission = true
             default:
                    break
            }
        } else {
            Helper.userAcceptPermission = false
        }
    }
}


//MARK: NotesListVC LocationManagerDelegate
extension NotesListVC : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
             return
           }
        
        self.lat = location.coordinate.latitude
        self.lng = location.coordinate.longitude
                print("locations = \(location.coordinate.latitude) \(location.coordinate.longitude)")

        locationManager.startUpdatingLocation()
    }
    
}

