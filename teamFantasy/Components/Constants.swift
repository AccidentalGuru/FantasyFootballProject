//
//  Constants.swift
//  teamFantasy
//
//  Created by David  Bowen on 11/16/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import UIKit

struct Constants {
    
    static let apiKey = "ApiKey"
    static let ApiKey = "cpsp3g6kz9da"
    
    
    struct API {
        static let ProjectionsKey = "Projections"
        static let DisplayNameKey = "displayName"
        static let ScheduleKey = "Schedule"
        static let ARIKey = "ARI"
        static let GameIdKey = "gameId"
        static let GameWeekKey = "gameWeek"
        static let GameDateKey = "gameDate"
        static let AwayTeamKey = "awayTeam"
        static let HomeTeamKey = "homeTeam"
        static let GameTimeKey = "gameTimeET"
        static let TvStationKey = "tvStation"
        static let InjuriesKey = "Injuries.ARI:"
        static let PlayerNameKey = "playerName"
        static let Team = "team"
        static let Position = "position"
        static let PlayersKey = "Players"
        static let RankingsKey = "Rankings"
        static let TeamCodeKey = "team"
        static let NameKey = "name"
        
        
        
        //QuarterBack
        static let PassAtt = "passAtt"
        static let PassCmp = "passCmp"
        static let PassYds = "passYds"
        static let PassTD = "passTD"
        
        //WideReceiver
        static let receptions = "receptions"
        static let recYds = "recYds"
        static let recTD = "recTD"
        
        //RunningBack
        static let rushAtt = "rushAtt"
        static let rushYds = "rushYds"
        //   static let receptions = "receptions"
        //   static let recYds = "recYds"
        //   static let recTD = "recTD"
        //TightEnd
        //   static let receptions = "receptions"
        //   static let recYds = "recYds"
        //   static let recTD = "recTD"
        
        //Kicker
        static let fg = "fg"
        static let fgAtt = "fgAtt"
        static let xp = "xp"
        
        //Defense
        static let defInt = "defInt"
        static let defSack = "defSack"
        static let defPA = "defPA"
        
        //NFL Teams
        static let code = "code"
        static let fullName = "fullName"
        static let shortName = "shortName"
        static let NFLTeams = "NFLTeams"

        
        //Players
        
        static let PlayerIdKey = "playerId"
        static let ActiveKey = "active"
        static let JerseyKey = "jersey"
        static let LnameKey = "lname"
        static let FnameKey = "fname"
        static let DisplayKey = "displayName"
        static let TeamKey = "team"
        static let PositionKey = "position"
        static let HeightKey = "height"
        static let WeightKey = "weight"
        static let DOBKey = "dob"
        static let CollegeKey = "college"
        
        //QuarterBack

        
        //WideReceiver

        
        //RunningBack
        static let rushTD = "rushTD"
       
        //   static let receptions = "receptions"
        //   static let recYds = "recYds"
        //   static let recTD = "recTD"
        //TightEnd
        //   static let receptions = "receptions"
        //   static let recYds = "recYds"
        //   static let recTD = "recTD"
        

        
    }
    
    public static let playerId = "playerId"
    public static let displayName = "displayName"
    public static let week = "week"
    public static let position = "position"
    public static let keychainIdentifier = "FootballKeychain"
    public static let authTokenExpireDate = "authTokenExpireDate"
    public static let authToken = "authToken"
    
    
    struct JSON {
        static let unknownError = "An Unknown Error Has Occurred"
        static let processingError = "There was an error processing the response"
    }
    
    struct QuarterBack {
        static let displayName = "displayName"
        static let passAtt = "passAtt"
        static let passCmp = "passCmp"
        static let passYds = "passYds"
        static let passTD = "passTD"
    }
    
    struct WideReceiver {
        static let receptions = "receptions"
        static let recYds = "recYds"
        static let recTD = "recTD"
    }
    
    struct RunningBack {
        static let rushAtt = "rushAtt"
        static let rushYds = "rushYds"
        static let receptions = "receptions"
        static let recYds = "recYds"
        static let recTD = "recTD"
    }
    
    struct TightEnd {
        static let receptions = "receptions"
        static let recYds = "recYds"
        static let recTD = "recTD"
    }
    
    struct Kicker {
        static let fg = "fg"
        static let fgAtt = "fgAtt"
        static let xp = "xp"
    }
    
    struct Defense {
        static let defInt = "defInt"
        static let defSack = "defSack"
        static let defPA = "defPA"
    }
    
    struct NFLTeams {
        static let code = "code"
        static let fullName = "fullName"
        static let shortName = "shortName"
        static let NFLTeams = "NFLTeams"
    }
    
  }
