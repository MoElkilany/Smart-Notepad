//
//  NoteDetailsVC.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 06/06/2021.
//

import UIKit
import RealmSwift

class NoteDetailsVC: UIViewController {
    
    var noteDetails:NotesModel!
    
    var mainView: NoteDetailsView {
        return view as! NoteDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadActivity()
    }
}
