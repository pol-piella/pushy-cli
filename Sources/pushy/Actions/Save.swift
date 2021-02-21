//
//  File.swift
//  
//
//  Created by Pol Piella Abadia on 21/02/2021.
//

import Foundation
import ArgumentParser

struct Save: ParsableCommand {
    @Argument(help: "Directory where you want to create the file") var directory: String
}
