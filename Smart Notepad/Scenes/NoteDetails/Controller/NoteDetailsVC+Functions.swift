//
//  NoteDetailsVC+Functions.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 06/06/2021.
//

import UIKit

extension NoteDetailsVC {
    
    
    func viewDidLoadActivity(){
        setDataView(model: self.noteDetails)
    }
    
    func setDataView(model:NotesModel){
        mainView.notePhotoStack.isHidden = model.notePhoto == "" ? true : false
        mainView.noteTitleLab.text = model.noteTitle
        mainView.noteDescriptionTV.text = model.noteBody
        mainView.noteLocationLab.text = model.address
    }
    
}
