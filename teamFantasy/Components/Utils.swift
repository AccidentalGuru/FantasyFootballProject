//
//  Utils.swift
//  teamFantasy
//
//  Created by David  Bowen on 11/16/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import Foundation
import AFDateHelper

class Utils {
    
    class func createAlert(_ title: String = "Error", message: String, dismissButtonTitle: String = "Dismiss") -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: dismissButtonTitle, style: .default, handler: nil))
        return alert
    }
    
    class func isValidEmail(_ testStr: String) -> Bool {
        let emailRegEx = "[A-Za-z0-9-_.]+[@]{1}[A-Za-z0-9-]+[.]*[A-Za-z0-9-]+[.]{1}[A-Za-z]+"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    class func adjustedTime(_ date: Date = Date()) -> Date {
        return date.dateByAddingSeconds(TimeZone.current.secondsFromGMT())
    }
    
    class func isNumber(_ string: String) -> Bool {
        let set = CharacterSet(charactersIn:"0123456789.-").inverted
        let components = string.components(separatedBy: set)
        let filtered = components.joined(separator: "")
        return string == filtered
    }
    
    class func formatNumber(_ amount: Double, prefix: String) -> String {
        return String(format: "\(prefix)$%.2f", abs(amount))
    }
    
    class func decodeImage(string: String) -> UIImage {
        if string.characters.count > 20 {
            let decodedData = Data(base64Encoded: string)
            if decodedData != nil {
                return UIImage(data: decodedData!)!
            } else{
                return #imageLiteral(resourceName: "blankAvatar")
            }
        }
        else {
            return #imageLiteral(resourceName: "blankAvatar")
        }
    }
    
    
    
}

