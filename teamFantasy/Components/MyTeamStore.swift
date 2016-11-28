//
//  MyTeamStore.swift
//  teamFantasy
//
//  Created by Sean Crowl on 11/18/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import UIKit

class MyTeamStore {
    static let shared = MyTeamStore()
    
    var teams: [[Team]]!
    
    var team = Team()
    var teamdetail = MyTeamViewController()
    
    
    init() {
        let filePath = archiveFilePath()
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: filePath) {
            teams = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as! [[Team]]
        } else {
            teams = [[], [], [], [], [], []]
            teams[0].append(Team(title: "Matthew McClellan", team: "INT"))
            teams[1].append(Team(title: "Izaak Prats", team: "INT"))
            teams[2].append(Team(title: "Scott Bowen", team: "INT"))
            teams[3].append(Team(title: "Kimberly Albright", team: "INT"))
            teams[4].append(Team(title: "Rubric Jones", team: "INT"))
            teams[5].append(Team(title: "Lane Terry", team: "INT"))
            save()
        }
        sort()
    }
    
    
    // MARK: - Public functions
    func getTeam(_ index: Int, categorySet: Int) -> Team {
        return teams[categorySet][index]
    }
    
    func addTeam(_ team: Team, categorySet: Int) {
        teams[categorySet].insert(team, at: 0)
        save()
    }
    
    func updateTeam(_ team: Team, index: Int, categorySet: Int) {
        teams[categorySet][index] = team
    }
    
    func deleteTeam(_ index: Int, categorySet: Int) {
        teams[categorySet].remove(at: index)
    }
    
    func getCount(categorySet: Int) -> Int {
        return teams[categorySet].count
    }
    
    func getCategoryCount() -> Int {
        return teamdetail.categoryArray.count
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(teams, toFile: archiveFilePath())
    }
    
    func sort() {
        for i in 0..<teams.count {
            teams[i].sort(by: { (team1, team2) -> Bool in
                return team1.priority < team2.priority
            })
        }
    }
    
    
    // MARK: - Private Functions
    fileprivate func archiveFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let documentsDirectory = paths.first!
        let path = (documentsDirectory as NSString).appendingPathComponent("MyTeamStore.plist")
        return path
    }
}

