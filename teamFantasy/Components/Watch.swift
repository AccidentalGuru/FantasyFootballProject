//
//  Watch.swift
//  teamFantasy
//
//  Created by David  Bowen on 11/21/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import Foundation
import UIKit

class Watch: NSObject, NSCoding {
    var name = ""
    
    let nameKey = "name"

    
    override init() {
        super.init()
        
    }
    
    init(name: String) {
        self.name = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: nameKey) as! String

        
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: nameKey)

    }
}



