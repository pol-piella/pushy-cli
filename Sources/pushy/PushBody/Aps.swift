//
//  Aps.swift
//  
//
//  Created by Pol Piella Abadia on 21/02/2021.
//

import Foundation

struct Aps: Encodable {
    let alert: Alert?
    let badge: Int?
    let sound: Sound?
    let category: String?
    let contentAvailable: Int?
    let mutableContent: Int?
    
    enum CodingKeys: String, CodingKey {
        case contentAvailable = "content-available"
        case mutableContent = "mutable-content"
        case alert, badge, sound, category
    }
}
