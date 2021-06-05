//
//  NotesModel.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 05/06/2021.
//

import Foundation
import  RealmSwift

class NotesModel :Object {
    
    @objc dynamic var currentLat = 0.0
    @objc dynamic var currentLng = 0.0
    @objc dynamic var address = ""
    @objc dynamic var noteTitle = ""
    @objc dynamic var noteBody = ""
    @objc dynamic var notePhoto = ""
    @objc dynamic var noteTime = ""

 
}
