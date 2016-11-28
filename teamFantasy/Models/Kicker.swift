//
//  Kicker.swift
//  TheReplacements
//
//  Created by Robert White on 11/14/16.
//  Copyright © 2016 Teky. All rights reserved.
//

import Foundation
import Alamofire
import Freddy


class Kicker {
    
    var playerId: String?
    var displayName: String?
    var position: String?
    
    var fg: String?
    var fgAtt: String?
    var xp: String?
    
    var requestType: RequestType = .fg
    
    enum RequestType {
        case fg
        case fgAtt
        case xp
        
        
    }
    required init() {
        requestType = .fg
    }
    required init(json: JSON) throws {
        playerId = try? json.getString(at: Constants.playerId)
        displayName = try? json.getString(at: Constants.displayName)
        position = try? json.getString(at: Constants.position)
        fg = try? json.getString(at: Constants.Kicker.fg)
        fgAtt = try? json.getString(at: Constants.Kicker.fgAtt)
        xp = try? json.getString(at: Constants.Kicker.xp)
        
        
    }
    
    init(displayName: String, fg: String) {
        self.displayName = displayName
        self.fg = fg
        requestType = .fg
    }
    
    init(displayName: String, fgAtt: String) {
        self.displayName = displayName
        self.fgAtt = fgAtt
        requestType = .fgAtt
    }
    
    init(displayName: String, xp: String) {
        self.displayName = displayName
        self.xp = xp
        requestType = .xp
    }
    
    
    
    func method() -> Alamofire.HTTPMethod {
        switch requestType {
            
        default:
            return .get
        }
    }
    
    func path() -> String {
        switch requestType {
        case .fg, .fgAtt, .xp:
            return "/service/weekly-projections/json/test/K/1/"
            
        }
    }
    func toDictionary() -> [String: AnyObject]? {
        var params: [String: AnyObject] = [:]
        
        switch requestType {
        case .fg:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.Kicker.fg] = fg as AnyObject?
        case .fgAtt:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.Kicker.fgAtt] = fgAtt as AnyObject?
        case .xp:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.Kicker.xp] = xp as AnyObject?

        }
        
        return params
    }
}
