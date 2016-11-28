//
//  WatchListStore.swift
//  teamFantasy
//
//  Created by David  Bowen on 11/21/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import Foundation

import UIKit

class WatchListStore {
    
    static let shared = WatchListStore()
    
    fileprivate var watches: [Watch]!
    
    init() {
        let filePath = archiveFilePath()
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: filePath) {
            watches = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as! [Watch]
        } else {
            watches = []
            watches.append(Watch(name: "Matthew McClellan"))
            watches.append(Watch(name: "Izaak Prats"))
            watches.append(Watch(name: "Scott Bowen"))
            watches.append(Watch(name: "Kimberly Albright"))
            watches.append(Watch(name: "Lane Terry"))
            save()
        }
        sort()
    }
    
    
    // MARK: - Public functions
    func getNote(_ index: Int) -> Watch {
        return watches[index]
    }
    
    func addNote(_ watch: Watch) {
        watches.insert(watch, at: 0)
    }
    
    func updateNote(_ watch: Watch, index: Int) {
        watches[index] = watch
    }
    
    func deleteNote(_ index: Int) {
        watches.remove(at: index)
    }
    
    func getCount() -> Int {
        return watches.count
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(watches, toFile: archiveFilePath())
    }
    

    
    
    func sort() {
        watches.sort { (watch1, watch2) -> Bool in
            return watch1.name.compare(watch2.name) == .orderedDescending
        }
    }
    
    // MARK: - Private Functions
    fileprivate func archiveFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let documentsDirectory = paths.first!
        let path = (documentsDirectory as NSString).appendingPathComponent("WatchListStore.plist")
        return path
    }
}

