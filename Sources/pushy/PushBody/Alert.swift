//
//  Alert.swift
//  
//
//  Created by Pol Piella Abadia on 21/02/2021.
//

import Foundation

struct Alert: Encodable {
    let title: String?
    let subtitle: String?
    let body: String?
    let launchImage: String?
    
    enum CodingKeys: String, CodingKey {
        case title, subtitle, body
        case launchImage = "launch-image"
    }
}

