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
        tableConfigration()
    }
    
    func setUpView(){
        mainView.addNoteBtn.layer.cornerRadius = 10
        mainView.addNoteBtn.layer.borderWidth = 1
        mainView.addNoteBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    func tableConfigration(){
        mainView.myNotesTable.register(UINib(nibName: MyNotesCell.cellID, bundle: nil), forCellReuseIdentifier:  MyNotesCell.cellID)
        mainView.myNotesTable.delegate = self
        mainView.myNotesTable.dataSource = self
//        mainView.myNotesTable.allowsMultipleSelection = true
        mainView.myNotesTable.showsVerticalScrollIndicator = false
        mainView.myNotesTable.showsHorizontalScrollIndicator = false
//        mainView.myNotesTable.separatorStyle = .none
    }
    
    
    
}

extension NotesListVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyNotesCell.cellID, for: indexPath) as!  MyNotesCell
        if indexPath.row == 3 {
            cell.noteBodyLab.text = "skdkvmkmvlmmlmalmkdmvkdasmvkvdsamkdskdmvslmdlskmkmsdakmlmvsadkmvsakmdsvskdkvmkmvlmmlmalmkdmvkdasmvkvdsamkdskdmvslmdlskmkmsdakmlmvsadkmvsakmdsv"
        }
        return cell
        
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}
