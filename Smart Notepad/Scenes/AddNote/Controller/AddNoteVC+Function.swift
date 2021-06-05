//
//  AddNoteVC+Function.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 05/06/2021.
//

import UIKit
import CoreLocation
import PhotosUI

extension AddNoteVC{
    
    func viewDidLoadactivity(){
        setUpView()
        actionButton()
        photoAccess()
        locationAuthorization()
        getCurrentTime()
    }
    
    func setUpView(){
        mainView.addPhotoBtn.isHidden = false
        mainView.imageSelected.isHidden = true
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
      let validFields = validationTextFieldWhenAddingNot()
        if validFields {
            setNoteData()
            print( "done")
        }
    }
    
    func validationTextFieldWhenAddingNot()->Bool{
        guard !mainView.noteTitleLab.text!.isEmpty  else {
            self.showAlert(title: "Title note is Empty ❌", message: "Please enter the title of note")
            return false
        }
        
        
        if  mainView.noteDescriptionTV.text == "Note Body Here"  {
            self.showAlert(title: "Body note is Empty ❌", message: "Please enter the Body of note")
            return false
        }
        
        
        if  mainView.addLocationBtn.currentTitle == "Add location"  {
            self.showAlert(title: "Please Choose your Loaction  ❌", message: "")
            return false
        }
        
        
        return true
    }

    
    @objc func addLocationBtnTapped(){
        if !userLocationPermission() {
            self.showPermissionAlert(title: "Location Permission", message: "Please active your location from Settings ")
        }else{
            mainView.addLocationBtn.setTitle(fullAddress, for: .normal)
            mainView.addLocationBtn.setTitleColor(.black, for: .normal)
        }
    }
    
    @objc func addPhotoBtnTapped(){
        if !isUserAccessPhoto{
            self.showPermissionAlert(title: "Photo Permission", message: "Please allow app to access  your Photo to choose from them ")

        }else{
            Helper.chosseOptionAlert(imagePicker: pickerImage, vc: self)
        }
    }
    
    //MARK:Location Permission
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
    
    func locationAuthorization(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    //MARK:photo Access Permission
    func photoAccess(){
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { [unowned self] (Authorization) in
            DispatchQueue.main.async { [unowned self] in
                userPhotoAuthorization(Authorization)
            }
        }
    }
    
    func userPhotoAuthorization(_ Authorization: PHAuthorizationStatus) {
        switch Authorization {
        case .authorized:
         print("authorized")
            isUserAccessPhoto = true
        case .denied,.restricted,.notDetermined:
            print("denied")
            isUserAccessPhoto = false
         default:
            break
        }
    }
    
    func getCurrentTime(){
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "HH:mm:ss"
        let dateString = dateFormatter.string(from: currentTime)
        print("dateString",dateString)
        let date = dateFormatter.date(from:dateString)!
        print("noteTime",date)
        self.noteTime =  date
    }
    
    
    func setNoteData(){

        let myNotes = NotesModel()
        myNotes.address = self.fullAddress
        myNotes.currentLat = self.lat
        myNotes.currentLng = self.lng
        myNotes.noteBody = mainView.noteDescriptionTV.text ?? "note Body"
        myNotes.noteTitle = mainView.noteTitleLab.text ?? "note Title"
        myNotes.noteTime = self.noteTime
        myNotes.notePhoto = ""
        realm.beginWrite()
        realm.add(myNotes)
        try! realm.commitWrite()
        self.navigationController?.popViewController(animated: true)
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
        
        let locale = Locale(identifier: "en")
        
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

extension AddNoteVC  : UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    func imagePickerController(_ picker:
                                UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        mainView.addPhotoBtn.isHidden = true
        mainView.imageSelected.isHidden = false
        mainView.imageSelected.image = image
        self.imageSelected = image
        dismiss(animated: true , completion: nil)
    }
}
