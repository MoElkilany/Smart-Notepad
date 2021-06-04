//
//  NotesListVC.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 04/06/2021.
//

import UIKit

class NotesListVC: UIViewController {
    
    var mainView :NotesListView {
        return view as! NotesListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadActivity()
        title = "Notes"
    }

}
