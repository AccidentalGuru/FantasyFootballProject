//
//  Defense.swift
//  TheReplacements
//
//  Created by Robert White on 11/14/16.
//  Copyright © 2016 Teky. All rights reserved.
//

import Foundation
import Alamofire
import Freddy


class Defense {
    
    var playerId: String?
    var displayName: String?
    var position: String?
    
    var defInt: String?
    var defSack: String?
    var defPA: String?
    
    
    var requestType: RequestType = .defInt
    
    enum RequestType {
        case defInt
        case defSack
        case defPA
        
        
    }
    required init() {
        requestType = .defInt
    }
    required init(json: JSON) throws {
        playerId = try? json.getString(at: Constants.playerId)
        displayName = try? json.getString(at: Constants.displayName)
        position = try? json.getString(at: Constants.position)
        defInt = try? json.getString(at: Constants.Defense.defInt)
        defSack = try? json.getString(at: Constants.Defense.defSack)
        defPA = try? json.getString(at: Constants.Defense.defPA)
        
        
    }
    
    init(displayName: String, defInt: String) {
        self.displayName = displayName
        self.defInt = defInt
        requestType = .defInt
    }
    
    init(displayName: String, defSack: String) {
        self.displayName = displayName
        self.defSack = defSack
        requestType = .defSack
    }
    
    init(displayName: String, defPA: String) {
        self.displayName = displayName
        self.defPA = defPA
        requestType = .defPA
    }
    
    
    
    func method() -> Alamofire.HTTPMethod {
        switch requestType {
            
        default:
            return .get
        }
    }
    
    func path() -> String {
        switch requestType {
        case .defInt, .defSack, .defPA:
            return "/service/weekly-projections/json/test/K/1/"
            
        }
    }
    func toDictionary() -> [String: AnyObject]? {
        var params: [String: AnyObject] = [:]
        
        switch requestType {
        case .defInt:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.Defense.defInt] = defInt as AnyObject?
        case .defSack:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.Defense.defSack] = defSack as AnyObject?
        case .defPA:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.Defense.defPA] = defPA as AnyObject?
        default:
            break
        }
        
        return params
    }
}
