//
//  NotesListVC+Function.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 04/06/2021.
//

import UIKit
import CoreLocation

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
        mainView.myNotesTable.showsVerticalScrollIndicator = false
        mainView.myNotesTable.showsHorizontalScrollIndicator = false
    }

    
}

extension NotesListVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyNotesCell.cellID, for: indexPath) as!  MyNotesCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            print("delete")
        }
        
        
        let editItem = UIContextualAction(style: .normal, title: "Edit") {  (contextualAction, view, boolValue) in
            view.backgroundColor = .blue
            contextualAction.backgroundColor = .blue
            
            print("edit")
        }
        
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteItem,editItem])
        
        return swipeActions
    }
    
    
    
    
}
