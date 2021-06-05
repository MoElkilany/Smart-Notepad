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
    var myNotes:Results<NotesModel>!
    
    var mainView :NotesListView {
        return view as! NotesListView
    }
    
    var  sortedDescendingNotesBasedOnTime = [NotesModel](){
                didSet{
                    mainView.myNotesTable.reloadData()
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Realm File" , Realm.Configuration.defaultConfiguration.fileURL!)
        viewDidLoadActivity()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMyNotesFromRealmData()
    }
    
}
