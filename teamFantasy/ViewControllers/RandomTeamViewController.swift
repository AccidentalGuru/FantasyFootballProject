//
//  RandomTeamViewController.swift
//  teamFantasy
//
//  Created by David  Bowen on 11/18/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON
import AlamofireSwiftyJSON

class RandomTeamViewController: UIViewController {
    
    var sortArray: [String] = [ ]
    var json: JSON = ""
    
    @IBOutlet weak var quarterBack: UILabel!
    @IBOutlet weak var wideReceiver: UILabel!
    @IBOutlet weak var wideReceiver2: UILabel!
    @IBOutlet weak var runningBack: UILabel!
    @IBOutlet weak var runningBack2: UILabel!
    @IBOutlet weak var tightEnd: UILabel!
    @IBOutlet weak var kicker: UILabel!
    @IBOutlet weak var flex: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://www.fantasyfootballnerd.com/service/players/json/cpsp3g6kz9da/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                self.json = JSON(value)
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func pickQB(_ sender: Any) {
        self.quarterBack.text = ""
        sortArray.removeAll()
        var qb = self.json
        
        guard let quarterBacks = qb[Constants.API.PlayersKey].array else { print("no"); fatalError() }
        
        
        for quarterBack in quarterBacks {
            if quarterBack[Constants.API.PositionKey] == "QB"
            {
                self.sortArray.append(quarterBack[Constants.API.FnameKey].string! + "  " + quarterBack[Constants.API.LnameKey].string! )
                
            }
        }
        let rand = Int(arc4random_uniform(100))
        self.quarterBack.text = self.sortArray[rand]
    }
    
    @IBAction func selectWideReceiver(_ sender: Any) {
        self.wideReceiver.text = ""
        sortArray.removeAll()
        var wr = self.json
        
        guard let wideReceivers = wr[Constants.API.PlayersKey].array else { print("no"); fatalError() }
        
        
        for wideReceiver in wideReceivers {
            if wideReceiver[Constants.API.PositionKey] == "WR"
            {
                self.sortArray.append(wideReceiver[Constants.API.FnameKey].string! + "  " + wideReceiver[Constants.API.LnameKey].string! )
                
            }
        }
        
        let rand = Int(arc4random_uniform(100))
        self.wideReceiver.text = self.sortArray[rand]
    }
    
    @IBAction func selectWideReceiver2(_ sender: Any) {
        self.wideReceiver2.text = ""
        sortArray.removeAll()
        var wr = self.json
        
        guard let wideReceivers = wr[Constants.API.PlayersKey].array else { print("no"); fatalError() }
        
        
        for wideReceiver in wideReceivers {
            if wideReceiver[Constants.API.PositionKey] == "WR"
            {
                self.sortArray.append(wideReceiver[Constants.API.FnameKey].string! + "  " + wideReceiver[Constants.API.LnameKey].string! )
                
            }
        }
       
        let rand = Int(arc4random_uniform(100))
        self.wideReceiver2.text = self.sortArray[rand]
    }
    
    @IBAction func selectRunningBack(_ sender: Any) {
        self.runningBack.text = ""
        sortArray.removeAll()
        var rb = self.json
        
        guard let runningBacks = rb[Constants.API.PlayersKey].array else { print("no"); fatalError() }
        
        
        for runningBack in runningBacks {
            if runningBack[Constants.API.PositionKey] == "RB"
            {
                self.sortArray.append(runningBack[Constants.API.FnameKey].string! + "  " + runningBack[Constants.API.LnameKey].string! )
                
            }
        }

        let rand = Int(arc4random_uniform(100))
        self.runningBack.text = self.sortArray[rand]
    }
    
    @IBAction func selectRunningBack2(_ sender: Any) {
        self.runningBack2.text = ""
        sortArray.removeAll()
        var rb = self.json
        
        guard let runningBacks = rb[Constants.API.PlayersKey].array else { print("no"); fatalError() }
        
        
        for runningBack in runningBacks {
            if runningBack[Constants.API.PositionKey] == "RB"
            {
                self.sortArray.append(runningBack[Constants.API.FnameKey].string! + "  " + runningBack[Constants.API.LnameKey].string! )
                
            }
        }
      
        let rand = Int(arc4random_uniform(100))
        self.runningBack2.text = self.sortArray[rand]
    }
    
    @IBAction func selectTightEnd(_ sender: Any) {
        self.tightEnd.text = ""
        sortArray.removeAll()
        var te = self.json
        
        guard let tightEnds = te[Constants.API.PlayersKey].array else { print("no"); fatalError() }
        
        
        for tightEnd in tightEnds {
            if tightEnd[Constants.API.PositionKey] == "TE"
            {
                self.sortArray.append(tightEnd[Constants.API.FnameKey].string! + "  " + tightEnd[Constants.API.LnameKey].string! )
                
            }
        }
        
        let rand = Int(arc4random_uniform(100))
        self.tightEnd.text = self.sortArray[rand]
    }
    
    @IBAction func selectKicker(_ sender: Any) {
        self.kicker.text = ""
        sortArray.removeAll()
        var k = self.json
        
        guard let kickers = k[Constants.API.PlayersKey].array else { print("no"); fatalError() }
        
        
        for kicker in kickers {
            if kicker[Constants.API.PositionKey] == "K"
            {
                self.sortArray.append(kicker[Constants.API.FnameKey].string! + "  " + kicker[Constants.API.LnameKey].string! )
                
            }
        }
  
        let rand = Int(arc4random_uniform(100))
        self.kicker.text = self.sortArray[rand]
    }
    
  
    @IBAction func selectFlex(_ sender: Any) {
        self.flex.text = ""
        sortArray.removeAll()
        var f = self.json
        
        guard let flexs = f[Constants.API.PlayersKey].array else { print("no"); fatalError() }
        
        
        for flex in flexs {
            if flex[Constants.API.PositionKey] == "WR" || flex[Constants.API.PositionKey] == "TE" || flex[Constants.API.PositionKey] == "RB"
            {
                self.sortArray.append(flex[Constants.API.FnameKey].string! + "  " + flex[Constants.API.LnameKey].string! )
                
            }
        }
   
        let rand = Int(arc4random_uniform(100))
        self.flex.text = self.sortArray[rand]

    }
    
    
    
    @IBAction func selectRandomTeam(_ sender: Any) {
        self.quarterBack.text = ""
        self.wideReceiver.text = ""
        self.wideReceiver2.text = ""
        self.runningBack.text = ""
        self.runningBack2.text = ""
        self.tightEnd.text = ""
        self.kicker.text = ""
        self.flex.text = ""
        
        pickQB(sender: Any.self)
        selectWideReceiver(sender: Any.self)
        selectWideReceiver2(sender: Any.self)
        selectRunningBack(sender: Any.self)
        selectRunningBack2(sender: Any.self)
        selectTightEnd(sender: Any.self)
        selectKicker(sender: Any.self)
        selectFlex(sender: Any.self)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
