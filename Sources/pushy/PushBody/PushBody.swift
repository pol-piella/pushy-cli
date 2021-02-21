//
//  PushBody.swift
//  
//
//  Created by Pol Piella Abadia on 21/02/2021.
//

import Foundation

struct PushBody: Encodable {
    let bundleIdentifier: String
    let aps: Aps
}
