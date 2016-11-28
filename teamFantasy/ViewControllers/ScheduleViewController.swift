//
//  ScheduleViewController.swift
//  teamFantasy
//
//  Created by David  Bowen on 11/15/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireSwiftyJSON


class ScheduleViewController: UIViewController {
    
    var myArray: [String] = [ ]
    
    var date = Date()
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.string(from: date)
    }
    
    @IBOutlet weak var completeSchedule: UITextField!
    @IBOutlet weak var scheduleResults: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleResults.text = ""
        myArray.removeAll()
        Alamofire.request("http://www.fantasyfootballnerd.com/service/schedule/json/cpsp3g6kz9da/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                guard let schedules = json[Constants.API.ScheduleKey].array else { print("no"); fatalError() }
                for schedule in schedules {
                    self.myArray.append(schedule[Constants.API.GameDateKey].string! + "  " + schedule[Constants.API.GameTimeKey].string! )
                    self.myArray.append("Home Team: " + schedule[Constants.API.HomeTeamKey].string!)
                    self.myArray.append("Away Team: " + schedule[Constants.API.AwayTeamKey].string!)
                    self.myArray.append("TV Station: " + schedule[Constants.API.TvStationKey].string!)
                    self.myArray.append("")
                    
                }
                
                self.scheduleResults.text = self.myArray.joined(separator: "\n")
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
    
    @IBAction func getSchedule(_ sender: Any) {
        scheduleResults.text = ""
        myArray.removeAll()
        Alamofire.request("http://www.fantasyfootballnerd.com/service/schedule/json/cpsp3g6kz9da/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
                
                guard let schedules = json[Constants.API.ScheduleKey].array else { print("no"); fatalError() }
                
                for schedule in schedules {
                    if self.completeSchedule.text == schedule[Constants.API.HomeTeamKey].string ||
                        self.completeSchedule.text == schedule[Constants.API.AwayTeamKey].string
                    {
                        self.myArray.append(schedule[Constants.API.GameDateKey].string! + "  " + schedule[Constants.API.GameTimeKey].string! )
                        self.myArray.append("Home Team: " + schedule[Constants.API.HomeTeamKey].string!)
                        self.myArray.append("Away Team: " + schedule[Constants.API.AwayTeamKey].string!)
                        self.myArray.append("TV Station: " + schedule[Constants.API.TvStationKey].string!)
                        self.myArray.append("")
                    }
                }

                self.scheduleResults.text = self.myArray.joined(separator: "\n")
                break
                
            case .failure(let error) :
                fatalError(error.localizedDescription)
                
            }
        }
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




