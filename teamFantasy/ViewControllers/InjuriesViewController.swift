//
//  InjuriesViewController.swift
//  teamFantasy
//
//  Created by David  Bowen on 11/16/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireSwiftyJSON

class InjuriesViewController: UIViewController {
    
     var myArray: [String] = []
    
    @IBOutlet weak var injuriesList: UITextView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func getInjuries(_ sender: Any) {
        Alamofire.request("http://www.fantasyfootballnerd.com/service/players/json/cpsp3g6kz9da/").responseJSON { response in
            switch response.result {
            case .success(let value) :
                var json = JSON(value)
            guard let players = json[Constants.API.PlayersKey].array else { print("no"); fatalError() }
                for player in players {
                    if player[Constants.API.ActiveKey].string == "0"
                    {
                        self.myArray.append(player[Constants.API.DisplayNameKey].string!)
                    }
                }
                
                self.injuriesList.text = self.myArray.joined(separator: "\n")
        
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
