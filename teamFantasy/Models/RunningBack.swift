//
//  RunningBack.swift
//  TheReplacements
//
//  Created by Robert White on 11/14/16.
//  Copyright © 2016 Teky. All rights reserved.
//

import Foundation
import Alamofire
import Freddy

class RunningBack {
    
    var playerId: String?
    var displayName: String?
    var position: String?
    
    var rushAtt: String?
    var rushYds: String?
    var receptions: String?
    var recYds: String?
    var recTD: String?
    
    var requestType: RequestType = .receptions
    
    enum RequestType {
        case rushAtt
        case rushYds
        case receptions
        case recYds
        case recTD
    }
    required init() {
        requestType = .receptions
    }
    required init(json: JSON) throws {
        playerId = try? json.getString(at: Constants.playerId)
        displayName = try? json.getString(at: Constants.displayName)
        position = try? json.getString(at: Constants.position)
        rushAtt = try? json.getString(at: Constants.RunningBack.rushAtt)
        rushYds = try? json.getString(at: Constants.RunningBack.rushYds)
        receptions = try? json.getString(at: Constants.RunningBack.receptions)
        recYds = try? json.getString(at: Constants.RunningBack.recYds)
        recTD = try? json.getString(at: Constants.RunningBack.recTD)
    }
    
    init(displayName: String, rushAtt: String) {
        self.displayName = displayName
        self.rushAtt = rushAtt
        requestType = .rushAtt
    }
    
    init(displayName: String, rushYds: String) {
        self.displayName = displayName
        self.rushYds = rushYds
        requestType = .rushYds
    }
    
    init(displayName: String, receptions: String) {
        self.displayName = displayName
        self.receptions = receptions
        requestType = .receptions
    }
    
    init(displayName: String, recYds: String) {
        self.displayName = displayName
        self.recYds = recYds
        requestType = .recYds
    }
    
    init(displayName: String, recTD: String) {
        self.displayName = displayName
        self.recTD = recTD
        requestType = .recTD
    }
    

    func method() -> Alamofire.HTTPMethod {
        switch requestType {
            
        default:
            return .get
        }
    }

    func path() -> String {
        switch requestType {
        case .rushAtt, .rushYds, .receptions, .recYds, .recTD:
            return "/service/weekly-projections/json/test/RB/1/"
     
        }
    }
    func toDictionary() -> [String: AnyObject]? {
        var params: [String: AnyObject] = [:]
        
        switch requestType {
        case .rushAtt:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.RunningBack.rushAtt] = rushAtt as AnyObject?
        case .rushYds:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.RunningBack.rushYds] = rushYds as AnyObject?
        case .receptions:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.RunningBack.receptions] = receptions as AnyObject?
        case .recYds:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.RunningBack.recYds] = recYds as AnyObject?
        case .recTD:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.RunningBack.recTD] = recTD as AnyObject?
        }
        
        return params
    }
}
