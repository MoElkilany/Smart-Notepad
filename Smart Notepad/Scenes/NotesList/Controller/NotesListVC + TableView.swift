//
//  NotesListVC + TableView.swift
//  Smart Notepad
//
//  Created by Mohamed Elkilany on 05/06/2021.
//

import UIKit

extension NotesListVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedDescendingNotesBasedOnTime.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyNotesCell.cellID, for: indexPath) as!  MyNotesCell
        cell.setUpCellData(model: sortedDescendingNotesBasedOnTime[indexPath.item], index: indexPath)
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
                 self.realm.delete(self.sortedDescendingNotesBasedOnTime[indexPath.item])
                try! self.realm.commitWrite()
            self.mainView.myNotesTable.reloadData()
            
            if self.myNotes.isEmpty {
                self.mainView.addNoteStack.isHidden = false
                self.mainView.myNotesTable.isHidden = true
            }
            
        }
        
        
        let editItem = UIContextualAction(style: .normal, title: "Edit") {  (contextualAction, view, boolValue) in
        
            let vc = 
            
            print("edit")
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteItem,editItem])
        return swipeActions
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NoteDetailsVC()
        vc.noteDetails = self.myNotes[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
