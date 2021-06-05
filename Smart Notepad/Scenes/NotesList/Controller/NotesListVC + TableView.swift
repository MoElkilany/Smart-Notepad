//
//  NotesListVC + TableView.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 05/06/2021.
//

import UIKit

extension NotesListVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNotes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyNotesCell.cellID, for: indexPath) as!  MyNotesCell
        cell.setUpCellData(model: myNotes[indexPath.item])
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
            
                self.realm.beginWrite()
                 self.realm.delete(self.myNotes[indexPath.item])
                try! self.realm.commitWrite()
            self.mainView.myNotesTable.reloadData()
            
            if self.myNotes.isEmpty {
                self.mainView.addNoteStack.isHidden = false
                self.mainView.myNotesTable.isHidden = true
            }
            
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
