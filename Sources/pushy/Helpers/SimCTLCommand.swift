//
//  SimCTLCommand.swift
//  
//
//  Created by Pol Piella Abadia on 21/02/2021.
//

import Foundation

enum SimCTLCommand: String {
    case push
    
    var arguments: [String] {
        ["xcrun", "simctl", self.rawValue, "booted"]
    }
}
