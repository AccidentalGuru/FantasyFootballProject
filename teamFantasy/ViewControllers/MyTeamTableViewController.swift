//
//  MyTeamTableViewController.swift
//  teamFantasy
//
//  Created by Sean Crowl on 11/18/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//


import UIKit

class MyTeamTableViewController: UITableViewController {
    @IBOutlet weak var showIncomplete: UISwitch!
    
    
    var team = Team()
    var teamcell = MyTeamTableViewCell()
    var myteamstore = MyTeamStore()
    var teamdetail = MyTeamViewController()
    var teams: [[Team]]!
    
    var completeTrue = 0
    var searching = false
    let searchController = UISearchController(searchResultsController: nil)
    var searchResults: [[Team]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search"
        self.navigationItem.titleView = searchController.searchBar
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //      self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return teamdetail.categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching && searchController.searchBar.text != "" {
            return searchResults[section].count
        }
        
        return MyTeamStore.shared.getCount(categorySet: section)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MyTeamTableViewCell.self)) as! MyTeamTableViewCell
        
        if searching && searchController.searchBar.text != "" {
            let team = searchResults[indexPath.section][indexPath.row]
            cell.setupCell(team: team)
        } else {
            cell.setupCell(team: MyTeamStore.shared.getTeam(indexPath.row, categorySet: indexPath.section))
        }
        
        if completeTrue == 1 {
            if cell.isComplete == true {
                cell.isHidden = true
                self.tableView.rowHeight = 0
            } else {
                cell.isHidden = false
                self.tableView.rowHeight = 80
            }
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let categoryArray = teamdetail.categoryArray as [String]?
        {
            return categoryArray[section]
        }
        
        // This should never happen, but is a fail safe
        return "unknown"
    }
    
    
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if sourceIndexPath.section == proposedDestinationIndexPath.section {
            return proposedDestinationIndexPath
        } else {
            return sourceIndexPath
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            MyTeamStore.shared.deleteTeam(indexPath.row, categorySet: indexPath.section)
            tableView.deleteRows(at: [indexPath], with: .fade)
            MyTeamStore.shared.save()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditTeamSegue" {
            let MyTeamDetailVC = segue.destination as! MyTeamViewController
            let tableCell = sender as! MyTeamTableViewCell
            MyTeamDetailVC.team = tableCell.team
            MyTeamStore.shared.save()
        }
    }
    
    // MARK: - Unwind Segue
    @IBAction func saveToDoDetail(_ segue: UIStoryboardSegue) {
        let MyTeamDetailVC = segue.source as! MyTeamViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            
            MyTeamStore.shared.deleteTeam(indexPath.row, categorySet: indexPath.section)
            MyTeamStore.shared.addTeam(MyTeamDetailVC.team, categorySet: MyTeamDetailVC.team.categorySet)
            tableView.reloadData()
            MyTeamStore.shared.save()
        } else {
            let indexPath = IndexPath(row: 0, section: MyTeamDetailVC.team.categorySet)
            MyTeamStore.shared.addTeam(MyTeamDetailVC.team, categorySet: indexPath.section)
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            MyTeamStore.shared.save()
            
            
        }
    }
    
    
    // MARK: - IBActions
    @IBAction func toggleIncomplete(_ sender: AnyObject) {
        if showIncomplete.isOn {
            completeTrue = 1
            self.tableView.reloadData()
        } else {
            completeTrue = 2
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Search Functions
    func searchTeams(searchText: String) -> [[Team]] {
        var searchResults: [[Team]] = []
        for index in 0..<teamdetail.categoryArray.count {
            searchResults.append(myteamstore.teams[index].filter({ (team) -> Bool in
                return team.title.lowercased().contains(searchText.lowercased())
            }))
        }
        
        return searchResults
    }
    
    
}

extension MyTeamTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, searchText != "" {
            searchResults = self.searchTeams(searchText: searchText)
        } else {
            searchResults = []
            for _ in 0..<MyTeamStore.shared.getCategoryCount() {
                searchResults.append([])
            }
        }
        tableView.reloadData()
    }
}

extension MyTeamTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text, searchText != "" {
            searchResults = self.searchTeams(searchText: searchText)
            
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searching = false
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchResults = []
        for _ in 0..<MyTeamStore.shared.getCategoryCount() {
            searchResults.append([])
        }
        tableView.reloadData()
    }
}
