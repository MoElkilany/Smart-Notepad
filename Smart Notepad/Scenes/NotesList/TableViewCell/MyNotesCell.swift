//
//  MyNotesCell.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 04/06/2021.
//

import UIKit

class MyNotesCell: UITableViewCell {

    static let cellID = "MyNotesCell"
    
    @IBOutlet fileprivate  weak var noteTitleLab: UILabel!
    @IBOutlet fileprivate  weak var noteBodyLab: UILabel!
    @IBOutlet fileprivate  weak var nearestLab: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        nearestLab.isHidden = true
    }
    
    func setUpCellData(model:NotesModel,index:IndexPath){
        
        if index.row == 0 {
            
            nearestLab.isHidden = false
        }
        noteTitleLab.text = model.noteTitle
        noteBodyLab.text = model.noteBody
    }
    
}
