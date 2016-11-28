//
//  QuarterBack.swift
//  TheReplacements
//
//  Created by Robert White on 11/14/16.
//  Copyright © 2016 Teky. All rights reserved.
//

import Foundation
import Alamofire
import Freddy


class QuarterBack {
    
    var playerId: String?
    var displayName: String?
    var position: String?
    
    var passAtt:  String?
    var passCmp: String?
    var passYds: String?
    var passTD: String?
    
    var requestType: RequestType = .passAtt
    
    enum RequestType {
        case passAtt
        case passCmp
        case passYds
        case passTD
        
    }
    required init() {
        requestType = .passTD
    }
    required init(json: JSON) throws {
        playerId = try? json.getString(at: Constants.playerId)
        displayName = try? json.getString(at: Constants.displayName)
        position = try? json.getString(at: Constants.position)
        passAtt = try? json.getString(at: Constants.QuarterBack.passAtt)
        passCmp = try? json.getString(at: Constants.QuarterBack.passCmp)
        passYds = try? json.getString(at: Constants.QuarterBack.passYds)
        passTD = try? json.getString(at: Constants.QuarterBack.passTD)
        
    }
    
    init(displayName: String, passAtt: String) {
        self.displayName = displayName
        self.passAtt = passAtt
        requestType = .passAtt
    }
    
    init(displayName: String, passCmp: String) {
        self.displayName = displayName
        self.passCmp = passCmp
        requestType = .passCmp
    }
    
    init(displayName: String, passYds: String) {
        self.displayName = displayName
        self.passYds = passYds
        requestType = .passYds
    }
    
    init(displayName: String, passTD: String) {
        self.displayName = displayName
        self.passTD = passTD
        requestType = .passTD
    }
    
    func method() -> Alamofire.HTTPMethod {
        switch requestType {
            
        default:
            return .get
        }
    }
    
    func path() -> String {
        switch requestType {
        case .passAtt, .passCmp, .passYds, .passTD:
            return "/service/weekly-projections/json/test/QB/1/"
            
        }
    }
    func toDictionary() -> [String: AnyObject]? {
        var params: [String: AnyObject] = [:]
        
        switch requestType {
        case .passAtt:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.QuarterBack.passAtt] = passAtt as AnyObject?
        case .passCmp:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.QuarterBack.passCmp] = passCmp as AnyObject?
        case .passYds:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.QuarterBack.passYds] = passYds as AnyObject?
        case .passTD:
            params[Constants.displayName] = displayName as AnyObject?
            params[Constants.QuarterBack.passTD] = passTD as AnyObject?
        }
        
        return params
    }
}
