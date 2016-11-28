//
//  WideReceiver.swift
//  TheReplacements
//
//  Created by Robert White on 11/14/16.
//  Copyright © 2016 Teky. All rights reserved.
//

import Foundation
import Alamofire
import Freddy


class WideReceiver {
    
    var playerId: String?
    var displayName: String?
    var position: String?
    
    var receptions: String?
    var recYds: String?
    var recTD: String?
    
    var requestType: RequestType = .receptions
    
    enum RequestType {
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
        receptions = try? json.getString(at: Constants.WideReceiver.receptions)
        recYds = try? json.getString(at: Constants.WideReceiver.recYds)
        recTD = try? json.getString(at: Constants.WideReceiver.recTD)
        
        
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
        case .receptions, .recYds, .recTD:
            return "/service/weekly-projections/json/test/WR/1/"
            
        }
    }
    func toDictionary() -> [String: AnyObject]? {
        var params: [String: AnyObject] = [:]
        
        switch requestType {
        case .receptions:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.WideReceiver.receptions] = receptions as AnyObject?
        case .recYds:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.WideReceiver.recYds] = recYds as AnyObject?
        case .recTD:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.WideReceiver.recTD] = recTD as AnyObject?

        }
        
        return params
    }
}
