//
//  PlayerSearchViewController.swift
//  teamFantasy
//
//  Created by Robert White on 11/18/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import UIKit
import UserNotifications
import Alamofire
import SwiftyJSON

class PlayerSearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var noteTitleField: UITextField!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var priorityField: UILabel!
    @IBOutlet weak var prioritySelect: UISegmentedControl!
    @IBOutlet weak var topPlayerStats: UITextView!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var playerPickedStats: UITextView!
    
    var empty = ""
    var myArray: [String] = [ ]
    var priority = ["QuarterBack", "WideReciever", "TightEnd", "RunningBack", "Kicker"]
    var catSubmit = 0
    var priSubmit = 0
    var category = ["Arizona Cardinals", "Atlanta Falcons", "Baltimore Ravens", "Buffalo Bills", "Carolina Panthers", "Chicago Bears", "Cincinnati Bengals", "Cleveland Browns",
                    "Dallas Cowboys", "Denver Broncos", "Detroit Lions", "Green Bay Packers", "Houston Texans", "Indianapolis Colts", "Jacksonville Jaguars", "Kansas City Chiefs",
                    "Los Angeles Rams", "Miami Dolphins", "Minnesota Vikings", "N.Y. Giants", "N.Y. Jets", "New England Patriots", "New Orleans Saints", "Oakland Raiders", "Philadelphia Eagles",
                    "Pittsburgh Steelers", "San Diego Chargers", "San Francisco 49ers", "Seattle Seahawks", "Tampa Bay Buccaneers", "Tennessee Titans", "Washington Redskins"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryPicker.delegate = self
        categoryPicker.delegate = self
        
   
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Switch statement to handle segment controller to give information to Api of what players to look for in the Nfl
    @IBAction func priorityChange(_ sender: UISegmentedControl) {
        switch prioritySelect.selectedSegmentIndex{
        case 0:
            priorityField.text = "QB"
            self.myArray.removeAll()
        case 1:
            priorityField.text = "WR"
            self.myArray.removeAll()
        case 2:
            priorityField.text = "TE"
            self.myArray.removeAll()
        case 3:
            priorityField.text = "RB"
            self.myArray.removeAll()
        case 4:
            priorityField.text = "K"
            self.myArray.removeAll()
        default:
            priorityField.text = ""
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    //This calls the api to get the Name, Team, and Position of players by team
       @IBAction func findPlayerClicked(_ sender: Any) {
        
        Alamofire.request("http://www.fantasyfootballnerd.com/service/players/json/2nx4m68a3wfb/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let projections = json[Constants.API.PlayersKey].array else { print("no"); fatalError() }
                
                
                
                for projection in projections {
                    if self.codeTextField.text == projection[Constants.API.TeamCodeKey].string {
                        self.myArray.append("Name: " + projection[Constants.API.DisplayNameKey].string!)
                        self.myArray.append("Team: " + projection[Constants.API.TeamCodeKey].string!)
                        self.myArray.append("Position: " + projection[Constants.API.Position].string!)
                        self.myArray.append("")
                    }
                }
                
                print(self.myArray.count)
                print(self.myArray[0])
                self.playerPickedStats.text = self.myArray.joined(separator: "\n")
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
    }
 
    // Top 15 Quarterbacks
   @IBAction func topPlayerClicked(_ sender: Any) {
        
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-rankings/json/2nx4m68a3wfb/QB/2/1/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let projections = json[Constants.API.RankingsKey].array else { print("no"); fatalError() }
                
                
                
                for projection in projections {
                    if self.priorityField.text == projection[Constants.API.Position].string {
                        self.myArray.append("Name: " + projection[Constants.API.NameKey].string!)
                        self.myArray.append("Team: " + projection[Constants.API.TeamCodeKey].string!)
                        self.myArray.append("Position: " + projection[Constants.API.Position].string!)
                        self.myArray.append("")
                        
                        
                        
                    }
                }
                
                print(self.myArray.count)
                
                self.topPlayerStats.text = self.myArray.joined(separator: "\n")
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        // Top 15 WideReceivers
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-rankings/json/2nx4m68a3wfb/WR/2/1/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let wr = json[Constants.API.RankingsKey].array else { print("no"); fatalError() }
                
                
                
                for wr in wr {
                    if self.priorityField.text == wr[Constants.API.Position].string {
                        self.myArray.append("Name: " + wr[Constants.API.NameKey].string!)
                        self.myArray.append("Team: " + wr[Constants.API.TeamCodeKey].string!)
                        self.myArray.append("Position: " + wr[Constants.API.Position].string!)
                        self.myArray.append("")
                        
                        
                        
                    }
                }
                
                print(self.myArray.count)
                
                self.topPlayerStats.text = self.myArray.joined(separator: "\n")
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        // Top 15 Tight Ends
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-rankings/json/2nx4m68a3wfb/TE/2/1/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let wr = json[Constants.API.RankingsKey].array else { print("no"); fatalError() }
                
                
                
                for wr in wr {
                    if self.priorityField.text == wr[Constants.API.Position].string {
                        self.myArray.append("Name: " + wr[Constants.API.NameKey].string!)
                        self.myArray.append("Team: " + wr[Constants.API.TeamCodeKey].string!)
                        self.myArray.append("Position: " + wr[Constants.API.Position].string!)
                        self.myArray.append("")
                        
                        
                        
                    }
                }
                
                print(self.myArray.count)
                
                self.topPlayerStats.text = self.myArray.joined(separator: "\n")
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        // Top 15 RunningBacks
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-rankings/json/2nx4m68a3wfb/RB/2/1/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let wr = json[Constants.API.RankingsKey].array else { print("no"); fatalError() }
                
                
                
                for wr in wr {
                    if self.priorityField.text == wr[Constants.API.Position].string {
                        self.myArray.append("Name: " + wr[Constants.API.NameKey].string!)
                        self.myArray.append("Team: " + wr[Constants.API.TeamCodeKey].string!)
                        self.myArray.append("Position: " + wr[Constants.API.Position].string!)
                        self.myArray.append("")
                        
                        
                        
                    }
                }
                
                print(self.myArray.count)
                
                self.topPlayerStats.text = self.myArray.joined(separator: "\n")
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        // Top 15 Kickers
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-rankings/json/2nx4m68a3wfb/K/2/1/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let wr = json[Constants.API.RankingsKey].array else { print("no"); fatalError() }
                
                
                
                for wr in wr {
                    if self.priorityField.text == wr[Constants.API.Position].string {
                        self.myArray.append("Name: " + wr[Constants.API.NameKey].string!)
                        self.myArray.append("Team: " + wr[Constants.API.TeamCodeKey].string!)
                        self.myArray.append("Position: " + wr[Constants.API.Position].string!)
                        self.myArray.append("")
                        
                        
                        
                    }
                }
                
                print(self.myArray.count)
                
                self.topPlayerStats.text = self.myArray.joined(separator: "\n")
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
    }
  
    
    
    // Statement that handles Information in textfield to tell the api what to look for Teamwise.
    // Also add a function to remove appended array data so it clears the TextView of the team data
    // when you switch between teams instead of added it to the same text view on the bottom
    @IBAction func categorySubmit(_ sender: AnyObject) {
        if (catSubmit == 0){
            noteTitleField.text = "Arizona Cardinals"
            codeTextField.text = "ARI"
            self.myArray.removeAll()
            
        }else if(catSubmit == 1){
            noteTitleField.text = "Atlanta Falcons"
            codeTextField.text = "ATL"
            self.myArray.removeAll()
            
        }else if(catSubmit == 2){
            noteTitleField.text = "Baltimore Ravens"
            codeTextField.text = "BAL"
            self.myArray.removeAll()
            
        }else if(catSubmit == 3){
            noteTitleField.text = "Buffalo Bills"
            codeTextField.text = "BUF"
            self.myArray.removeAll()
            
        }else if(catSubmit == 4){
            noteTitleField.text = "Carolina Panthers"
            codeTextField.text = "CAR"
            self.myArray.removeAll()
            
        }else if(catSubmit == 5){
            noteTitleField.text = "Chicago Bears"
            codeTextField.text = "CHI"
            self.myArray.removeAll()
            
        }else if(catSubmit == 6){
            noteTitleField.text = "Cincinnati Bengals"
            codeTextField.text = "CIN"
            self.myArray.removeAll()
            
        }else if(catSubmit == 7){
            noteTitleField.text = "Cleveland Browns"
            codeTextField.text = "CLE"
            self.myArray.removeAll()
            
        }else if(catSubmit == 8){
            noteTitleField.text = "Dallas Cowboys"
            codeTextField.text = "DAL"
            self.myArray.removeAll()
            
        }else if(catSubmit == 9){
            noteTitleField.text = "Denver Broncos"
            codeTextField.text = "DEN"
            self.myArray.removeAll()
            
        }else if(catSubmit == 10){
            noteTitleField.text = "Detroit Lions"
            codeTextField.text = "DET"
            self.myArray.removeAll()
            
        }else if(catSubmit == 11){
            noteTitleField.text = "Green Bay Packers"
            codeTextField.text = "BG"
            self.myArray.removeAll()
            
        }else if(catSubmit == 12){
            noteTitleField.text = "Houston Texans"
            codeTextField.text = "HOU"
            self.myArray.removeAll()
            
        }else if(catSubmit == 13){
            noteTitleField.text = "Indianapolis Colts"
            codeTextField.text = "IND"
            self.myArray.removeAll()
            
        }else if(catSubmit == 14){
            noteTitleField.text = "Jacksonville Jaguars"
            codeTextField.text = "JAC"
            self.myArray.removeAll()
            
        }else if(catSubmit == 15){
            noteTitleField.text = "Kansas City Chiefs"
            codeTextField.text = "KC"
            self.myArray.removeAll()
            
        }else if(catSubmit == 16){
            noteTitleField.text = "Los Angeles Rams"
            codeTextField.text = "MIA"
            self.myArray.removeAll()
            
        }else if(catSubmit == 17){
            noteTitleField.text = "Miami Dolphins"
            codeTextField.text = "MIA"
            self.myArray.removeAll()
            
        }else if(catSubmit == 18){
            noteTitleField.text = "Minnesota Vikings"
            codeTextField.text = "MIN"
            self.myArray.removeAll()
            
        }else if(catSubmit == 19){
            noteTitleField.text = "N.Y. Giants"
            codeTextField.text = "NYG"
            self.myArray.removeAll()
            
        }else if(catSubmit == 20){
            noteTitleField.text = "N.Y. Jets"
            codeTextField.text = "NYJ"
            self.myArray.removeAll()
            
        }else if(catSubmit == 21){
            noteTitleField.text = "New England Patriots"
            codeTextField.text = "NE"
            self.myArray.removeAll()
            
        }else if(catSubmit == 22){
            noteTitleField.text = "New Orleans Saints"
            codeTextField.text = "NO"
            self.myArray.removeAll()
            
        }else if(catSubmit == 23){
            noteTitleField.text = "Oakland Raiders"
            codeTextField.text = "OAK"
            self.myArray.removeAll()
            
        }else if(catSubmit == 24){
            noteTitleField.text = "Philadelphia Eagles"
            codeTextField.text = "PHI"
            self.myArray.removeAll()
            
        }else if(catSubmit == 25){
            noteTitleField.text = "Pittsburgh Steelers"
            codeTextField.text = "PIT"
            self.myArray.removeAll()
            
        }else if(catSubmit == 26){
            noteTitleField.text = "San Diego Chargers"
            codeTextField.text = "SD"
            self.myArray.removeAll()
            
        }else if(catSubmit == 27){
            noteTitleField.text = "San Francisco 49ers"
            codeTextField.text = "SF"
            self.myArray.removeAll()
            
        }else if(catSubmit == 28){
            noteTitleField.text = "Seattle Seahawks"
            codeTextField.text = "SEA"
            self.myArray.removeAll()
            
        }else if(catSubmit == 29){
            noteTitleField.text = "Tampa Bay Buccaneers"
            codeTextField.text = "TB"
            self.myArray.removeAll()
            
        }else if(catSubmit == 30){
            noteTitleField.text = "Tennessee Titans"
            codeTextField.text = "TEN"
            self.myArray.removeAll()
            
        }else if(catSubmit == 31){
            noteTitleField.text = "Washington Redskins"
            codeTextField.text = "WAS"
            self.myArray.removeAll()
            
        }else{
            return
        }
    }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            catSubmit = row
        }

}
