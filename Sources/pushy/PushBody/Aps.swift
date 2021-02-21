//
//  Aps.swift
//  
//
//  Created by Pol Piella Abadia on 21/02/2021.
//

import Foundation

struct Aps: Encodable {
    let alert: Alert
    let badge: Int
    let sound: Sound? = nil
    let category: String? = nil
    let contentAvailable: Int? = nil
    let mutableContent: Int? = nil
}
