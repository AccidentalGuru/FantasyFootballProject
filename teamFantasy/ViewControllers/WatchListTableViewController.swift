//
//  WatchListTableViewController.swift
//  teamFantasy
//
//  Created by David  Bowen on 11/21/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import UIKit

class WatchListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return WatchListStore.shared.getCount()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WatchListTableViewCell.self)) as! WatchListTableViewCell
        
        cell.setupCell(WatchListStore.shared.getNote(indexPath.row))
        
        return cell
    }
    
    
    @IBAction func saveWatchList(_ segue: UIStoryboardSegue) {
        
        let WatchListVC = segue.source as! WatchListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow { //if there is an indexPath for the given row
            //NoteStore.shared.updateNote(noteDetailVC.note, index: indexPath.row) //change the note info for the given row to what the note has been changed to in the NoteDetailViewController DON'T NEED THIS BECAUSE OF REFERENCE TYPE
            WatchListStore.shared.sort()
            
            var indexPaths: [IndexPath] = []
            for index in 0...indexPath.row {
                indexPaths.append(IndexPath(row: index, section: 0))
            }
            
            tableView.reloadRows(at: indexPaths, with: .automatic) //reload the row so that it is updated properly
        } else { //we are making a new note
            //notes.append(noteDetailVC.note)
            WatchListStore.shared.addNote(WatchListVC.watch)
            let indexPath = IndexPath(row: 0, section: 0) //the path for this new note is that it will be the last value in the array, and will go in our only section
            tableView.insertRows(at: [indexPath], with: .automatic) //add the new row to our tableView
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            WatchListStore.shared.deleteNote(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "EditNoteSegue" {
            let WatchListVC = segue.destination as! WatchListViewController //where we're going, forcing it to be set as a NoteDetailViewController because we know that's what it is
            let tableCell = sender as! WatchListTableViewCell //the cell we clicked on
            WatchListVC.watch = tableCell.watch //the note in the note detail VC will have the same contents as the cell we clicked on
        }
    }
    
}
