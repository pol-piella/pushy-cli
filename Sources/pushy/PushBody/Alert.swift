//
//  Alert.swift
//  
//
//  Created by Pol Piella Abadia on 21/02/2021.
//

import Foundation

struct Alert: Encodable {
    let title: String
    let subtitle: String
    let body: String
    let launchImage: String? = nil
    let titleLocKey: String? = nil
    let subtitleLocArgs: String? = nil
    let locKey: String? = nil
    let locArgs: String? = nil
}

