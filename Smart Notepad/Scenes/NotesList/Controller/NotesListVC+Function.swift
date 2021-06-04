//
//  NotesListVC+Function.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 04/06/2021.
//

import UIKit

extension NotesListVC {
    
    func viewDidLoadActivity(){
        setUpView()
    }
    
    func setUpView(){
        mainView.addNoteBtn.layer.cornerRadius = 10
        mainView.addNoteBtn.layer.borderWidth = 1
        mainView.addNoteBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    
    
}
