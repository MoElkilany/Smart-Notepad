//
//  AddNoteVC+Function.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 05/06/2021.
//

import UIKit
import CoreLocation

extension AddNoteVC{
    
    func viewDidLoadactivity(){
        setUpView()
        actionButton()
    }
    
    
    func setUpView(){
        mainView.noteDescriptionTV.delegate = self
        mainView.noteDescriptionTV.text = "Note Body Here"
        mainView.noteDescriptionTV.textColor = UIColor.lightGray
        mainView.addNoteBtn.layer.cornerRadius = 10
        mainView.addNoteBtn.layer.borderWidth = 1
        mainView.addNoteBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    func actionButton(){
        mainView.addNoteBtn.addTarget(self, action: #selector(addNoteBtnTapped), for: .touchUpInside)
        mainView.addLocationBtn.addTarget(self, action: #selector(addLocationBtnTapped), for: .touchUpInside)
        mainView.addPhotoBtn.addTarget(self, action: #selector(addPhotoBtnTapped), for: .touchUpInside)
        
    }
    
    @objc func addNoteBtnTapped(){
        
    }
    
    @objc func addLocationBtnTapped(){
     
        if !userLocationPermission() {
            self.showLocationPermissionAlert()
        }else{
            mainView.addLocationBtn.setTitle(fullAddress, for: .normal)
            mainView.addLocationBtn.setTitleColor(.black, for: .normal)
        }
    }
    
    @objc func addPhotoBtnTapped(){
        
    }
    
    
    func userLocationPermission()->Bool  {
        var userAcceptPermission = false
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
            case .notDetermined, .restricted, .denied:
                userAcceptPermission = false
                
            case .authorizedAlways, .authorizedWhenInUse:
                 userAcceptPermission = true
             default:
                    break
            }
        } else {
            userAcceptPermission = false
        }
        return userAcceptPermission
    }
    
}
    
//MARK: noteDescriptionTV Delegate
extension AddNoteVC : UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Note Body Here"
            textView.textColor = UIColor.lightGray
        }
    }
}


//MARK: AddNoteVC LocationManagerDelegate
extension AddNoteVC : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
             return
           }

            
        self.lat = location.coordinate.latitude
        self.lng = location.coordinate.longitude
                print("locations = \(location.coordinate.latitude) \(location.coordinate.longitude)")

        reverseGeocodeLocation(location)
        locationManager.startUpdatingLocation()
    }
    
    func reverseGeocodeLocation(_ location: CLLocation) {
        
        let locale = Locale(identifier: "ar")
        
        CLGeocoder().reverseGeocodeLocation(location, preferredLocale: locale) { placemarks, error in
            if let placemark = placemarks?.first {
                DispatchQueue.main.async {
                    print("placemark \(placemark)" )
                    let address = (placemark.name ?? "") + " " + (placemark.subLocality ?? "" )
                        let fullAddress = address + " " + (placemark.locality ?? "")
                  print("fullAddress, ",fullAddress)
                    self.fullAddress = fullAddress
                    UIView.animate(withDuration: 0.25) {
                        self.view.layoutIfNeeded()
                    }
                }
            }
        }
    }
}
