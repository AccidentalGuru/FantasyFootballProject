//
//  CompareViewController.swift
//  teamFantasy
//
//  Created by Sean Crowl on 11/21/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CompareViewController: UIViewController {
    @IBOutlet weak var enterNameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var completionsLabel: UILabel!
    @IBOutlet weak var passYardsLabel: UILabel!
    @IBOutlet weak var passTDsLabel: UILabel!
    @IBOutlet weak var rushYardsLabel: UILabel!
    @IBOutlet weak var rushTDsLabel: UILabel!
    @IBOutlet weak var receivingYardsLabel: UILabel!
    @IBOutlet weak var receivingTDsLabel: UILabel!
    @IBOutlet weak var PAsLabel: UILabel!
    @IBOutlet weak var FGsLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var enterNameField2: UITextField!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var positionLabel2: UILabel!
    @IBOutlet weak var completionsLabel2: UILabel!
    @IBOutlet weak var passYardsLabel2: UILabel!
    @IBOutlet weak var passTDsLabel2: UILabel!
    @IBOutlet weak var rushYardsLabel2: UILabel!
    @IBOutlet weak var rushTDsLabel2: UILabel!
    @IBOutlet weak var receivingYardsLabel2: UILabel!
    @IBOutlet weak var receivingTDsLabel2: UILabel!
    @IBOutlet weak var PAsLabel2: UILabel!
    @IBOutlet weak var FGsLabel2: UILabel!
    @IBOutlet weak var teamLabel2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - IBActions
    @IBAction func AddPlayerClicked1(_ sender: Any) {
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-projections/json/cpsp3g6kz9da/QB/11/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let quarterbacks = json[Constants.API.ProjectionsKey].array else { print("no"); fatalError() }
                
                for quarterback in quarterbacks {
                    if self.enterNameField.text == quarterback[Constants.API.DisplayNameKey].string {
                        
                        self.nameLabel.text = quarterback[Constants.API.DisplayNameKey].string!
                        self.positionLabel.text = quarterback[Constants.API.Position].string!
                        self.completionsLabel.text = "\(quarterback[Constants.API.PassCmp].string!) / \(quarterback[Constants.API.PassAtt].string!)"
                        self.passYardsLabel.text = quarterback[Constants.API.PassYds].string!
                        self.passTDsLabel.text = quarterback[Constants.API.PassTD].string!
                        self.rushYardsLabel.text = quarterback[Constants.API.rushYds].string!
                        self.rushTDsLabel.text = quarterback[Constants.API.rushTD].string!
                        self.receivingYardsLabel.text = quarterback[Constants.API.recYds].string!
                        self.receivingTDsLabel.text = quarterback[Constants.API.recTD].string!
                        self.FGsLabel.text = quarterback[Constants.API.fg].string!
                        self.PAsLabel.text = quarterback[Constants.API.xp].string!
                        self.teamLabel.text = quarterback[Constants.API.Team].string!
                    }
                    
                }
                
                
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-projections/json/cpsp3g6kz9da/WR/11/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let receivers = json[Constants.API.ProjectionsKey].array else { print("no"); fatalError() }
                
                for receiver in receivers {
                    if self.enterNameField.text == receiver[Constants.API.DisplayNameKey].string {
                        
                        self.nameLabel.text = receiver[Constants.API.DisplayNameKey].string!
                        self.positionLabel.text = receiver[Constants.API.Position].string!
                        self.completionsLabel.text = "\(receiver[Constants.API.PassCmp].string!) / \(receiver[Constants.API.PassAtt].string!)"
                        self.passYardsLabel.text = receiver[Constants.API.PassYds].string!
                        self.passTDsLabel.text = receiver[Constants.API.PassTD].string!
                        self.rushYardsLabel.text = receiver[Constants.API.rushYds].string!
                        self.rushTDsLabel.text = receiver[Constants.API.rushTD].string!
                        self.receivingYardsLabel.text = receiver[Constants.API.recYds].string!
                        self.receivingTDsLabel.text = receiver[Constants.API.recTD].string!
                        self.FGsLabel.text = receiver[Constants.API.fg].string!
                        self.PAsLabel.text = receiver[Constants.API.xp].string!
                        self.teamLabel.text = receiver[Constants.API.Team].string!
                    }
                }
                
                
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-projections/json/cpsp3g6kz9da/RB/11/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let runningbacks = json[Constants.API.ProjectionsKey].array else { print("no"); fatalError() }
                
                for runningback in runningbacks {
                    if self.enterNameField.text == runningback[Constants.API.DisplayNameKey].string {
                        
                        self.nameLabel.text = runningback[Constants.API.DisplayNameKey].string!
                        self.positionLabel.text = runningback[Constants.API.Position].string!
                        self.completionsLabel.text = "\(runningback[Constants.API.PassCmp].string!) / \(runningback[Constants.API.PassAtt].string!)"
                        self.passYardsLabel.text = runningback[Constants.API.PassYds].string!
                        self.passTDsLabel.text = runningback[Constants.API.PassTD].string!
                        self.rushYardsLabel.text = runningback[Constants.API.rushYds].string!
                        self.rushTDsLabel.text = runningback[Constants.API.rushTD].string!
                        self.receivingYardsLabel.text = runningback[Constants.API.recYds].string!
                        self.receivingTDsLabel.text = runningback[Constants.API.recTD].string!
                        self.FGsLabel.text = runningback[Constants.API.fg].string!
                        self.PAsLabel.text = runningback[Constants.API.xp].string!
                        self.teamLabel.text = runningback[Constants.API.Team].string!
                    }
                }
                
                
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-projections/json/cpsp3g6kz9da/TE/11/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let tightends = json[Constants.API.ProjectionsKey].array else { print("no"); fatalError() }
                
                for tightend in tightends {
                    if self.enterNameField.text == tightend[Constants.API.DisplayNameKey].string {
                        
                        self.nameLabel.text = tightend[Constants.API.DisplayNameKey].string!
                        self.positionLabel.text = tightend[Constants.API.Position].string!
                        self.completionsLabel.text = "\(tightend[Constants.API.PassCmp].string!) / \(tightend[Constants.API.PassAtt].string!)"
                        self.passYardsLabel.text = tightend[Constants.API.PassYds].string!
                        self.passTDsLabel.text = tightend[Constants.API.PassTD].string!
                        self.rushYardsLabel.text = tightend[Constants.API.rushYds].string!
                        self.rushTDsLabel.text = tightend[Constants.API.rushTD].string!
                        self.receivingYardsLabel.text = tightend[Constants.API.recYds].string!
                        self.receivingTDsLabel.text = tightend[Constants.API.recTD].string!
                        self.FGsLabel.text = tightend[Constants.API.fg].string!
                        self.PAsLabel.text = tightend[Constants.API.xp].string!
                        self.teamLabel.text = tightend[Constants.API.Team].string!
                    }
                }
                
                
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-projections/json/cpsp3g6kz9da/K/11/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let kickers = json[Constants.API.ProjectionsKey].array else { print("no"); fatalError() }
                
                for kicker in kickers {
                    if self.enterNameField.text == kicker[Constants.API.DisplayNameKey].string {
                        
                        self.nameLabel.text = kicker[Constants.API.DisplayNameKey].string!
                        self.positionLabel.text = kicker[Constants.API.Position].string!
                        self.completionsLabel.text = "\(kicker[Constants.API.PassCmp].string!) / \(kicker[Constants.API.PassAtt].string!)"
                        self.passYardsLabel.text = kicker[Constants.API.PassYds].string!
                        self.passTDsLabel.text = kicker[Constants.API.PassTD].string!
                        self.rushYardsLabel.text = kicker[Constants.API.rushYds].string!
                        self.rushTDsLabel.text = kicker[Constants.API.rushTD].string!
                        self.receivingYardsLabel.text = kicker[Constants.API.recYds].string!
                        self.receivingTDsLabel.text = kicker[Constants.API.recTD].string!
                        self.FGsLabel.text = kicker[Constants.API.fg].string!
                        self.PAsLabel.text = kicker[Constants.API.xp].string!
                        self.teamLabel.text = kicker[Constants.API.Team].string!
                    }
                }
                
                
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }

    }
    
    @IBAction func AddPlayerClicked2(_ sender: Any) {
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-projections/json/cpsp3g6kz9da/QB/11/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let quarterbacks = json[Constants.API.ProjectionsKey].array else { print("no"); fatalError() }
                
                for quarterback in quarterbacks {
                    if self.enterNameField2.text == quarterback[Constants.API.DisplayNameKey].string {
                        
                        self.nameLabel2.text = quarterback[Constants.API.DisplayNameKey].string!
                        self.positionLabel2.text = quarterback[Constants.API.Position].string!
                        self.completionsLabel2.text = "\(quarterback[Constants.API.PassCmp].string!) / \(quarterback[Constants.API.PassAtt].string!)"
                        self.passYardsLabel2.text = quarterback[Constants.API.PassYds].string!
                        self.passTDsLabel2.text = quarterback[Constants.API.PassTD].string!
                        self.rushYardsLabel2.text = quarterback[Constants.API.rushYds].string!
                        self.rushTDsLabel2.text = quarterback[Constants.API.rushTD].string!
                        self.receivingYardsLabel2.text = quarterback[Constants.API.recYds].string!
                        self.receivingTDsLabel2.text = quarterback[Constants.API.recTD].string!
                        self.FGsLabel2.text = quarterback[Constants.API.fg].string!
                        self.PAsLabel2.text = quarterback[Constants.API.xp].string!
                        self.teamLabel2.text = quarterback[Constants.API.Team].string!
                    }
                    
                }
                
                
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-projections/json/cpsp3g6kz9da/WR/11/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let receivers = json[Constants.API.ProjectionsKey].array else { print("no"); fatalError() }
                
                for receiver in receivers {
                    if self.enterNameField2.text == receiver[Constants.API.DisplayNameKey].string {
                        
                        self.nameLabel2.text = receiver[Constants.API.DisplayNameKey].string!
                        self.positionLabel2.text = receiver[Constants.API.Position].string!
                        self.completionsLabel2.text = "\(receiver[Constants.API.PassCmp].string!) / \(receiver[Constants.API.PassAtt].string!)"
                        self.passYardsLabel2.text = receiver[Constants.API.PassYds].string!
                        self.passTDsLabel2.text = receiver[Constants.API.PassTD].string!
                        self.rushYardsLabel2.text = receiver[Constants.API.rushYds].string!
                        self.rushTDsLabel2.text = receiver[Constants.API.rushTD].string!
                        self.receivingYardsLabel2.text = receiver[Constants.API.recYds].string!
                        self.receivingTDsLabel2.text = receiver[Constants.API.recTD].string!
                        self.FGsLabel2.text = receiver[Constants.API.fg].string!
                        self.PAsLabel2.text = receiver[Constants.API.xp].string!
                        self.teamLabel2.text = receiver[Constants.API.Team].string!
                    }
                }
                
                
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-projections/json/cpsp3g6kz9da/RB/11/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let runningbacks = json[Constants.API.ProjectionsKey].array else { print("no"); fatalError() }
                
                for runningback in runningbacks {
                    if self.enterNameField2.text == runningback[Constants.API.DisplayNameKey].string {
                        
                        self.nameLabel2.text = runningback[Constants.API.DisplayNameKey].string!
                        self.positionLabel2.text = runningback[Constants.API.Position].string!
                        self.completionsLabel2.text = "\(runningback[Constants.API.PassCmp].string!) / \(runningback[Constants.API.PassAtt].string!)"
                        self.passYardsLabel2.text = runningback[Constants.API.PassYds].string!
                        self.passTDsLabel2.text = runningback[Constants.API.PassTD].string!
                        self.rushYardsLabel2.text = runningback[Constants.API.rushYds].string!
                        self.rushTDsLabel2.text = runningback[Constants.API.rushTD].string!
                        self.receivingYardsLabel2.text = runningback[Constants.API.recYds].string!
                        self.receivingTDsLabel2.text = runningback[Constants.API.recTD].string!
                        self.FGsLabel2.text = runningback[Constants.API.fg].string!
                        self.PAsLabel2.text = runningback[Constants.API.xp].string!
                        self.teamLabel2.text = runningback[Constants.API.Team].string!
                    }
                }
                
                
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-projections/json/cpsp3g6kz9da/TE/11/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let tightends = json[Constants.API.ProjectionsKey].array else { print("no"); fatalError() }
                
                for tightend in tightends {
                    if self.enterNameField2.text == tightend[Constants.API.DisplayNameKey].string {
                        
                        self.nameLabel2.text = tightend[Constants.API.DisplayNameKey].string!
                        self.positionLabel2.text = tightend[Constants.API.Position].string!
                        self.completionsLabel2.text = "\(tightend[Constants.API.PassCmp].string!) / \(tightend[Constants.API.PassAtt].string!)"
                        self.passYardsLabel2.text = tightend[Constants.API.PassYds].string!
                        self.passTDsLabel2.text = tightend[Constants.API.PassTD].string!
                        self.rushYardsLabel2.text = tightend[Constants.API.rushYds].string!
                        self.rushTDsLabel2.text = tightend[Constants.API.rushTD].string!
                        self.receivingYardsLabel2.text = tightend[Constants.API.recYds].string!
                        self.receivingTDsLabel2.text = tightend[Constants.API.recTD].string!
                        self.FGsLabel2.text = tightend[Constants.API.fg].string!
                        self.PAsLabel2.text = tightend[Constants.API.xp].string!
                        self.teamLabel2.text = tightend[Constants.API.Team].string!
                    }
                }
                
                
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
        
        Alamofire.request("http://www.fantasyfootballnerd.com/service/weekly-projections/json/cpsp3g6kz9da/K/11/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let kickers = json[Constants.API.ProjectionsKey].array else { print("no"); fatalError() }
                
                for kicker in kickers {
                    if self.enterNameField2.text == kicker[Constants.API.DisplayNameKey].string {
                        
                        self.nameLabel2.text = kicker[Constants.API.DisplayNameKey].string!
                        self.positionLabel2.text = kicker[Constants.API.Position].string!
                        self.completionsLabel2.text = "\(kicker[Constants.API.PassCmp].string!) / \(kicker[Constants.API.PassAtt].string!)"
                        self.passYardsLabel2.text = kicker[Constants.API.PassYds].string!
                        self.passTDsLabel2.text = kicker[Constants.API.PassTD].string!
                        self.rushYardsLabel2.text = kicker[Constants.API.rushYds].string!
                        self.rushTDsLabel2.text = kicker[Constants.API.rushTD].string!
                        self.receivingYardsLabel2.text = kicker[Constants.API.recYds].string!
                        self.receivingTDsLabel2.text = kicker[Constants.API.recTD].string!
                        self.FGsLabel2.text = kicker[Constants.API.fg].string!
                        self.PAsLabel2.text = kicker[Constants.API.xp].string!
                        self.teamLabel2.text = kicker[Constants.API.Team].string!
                    }
                }
                
                
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }

    }
    
    

}
