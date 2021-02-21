//
//  Shell.swift
//  
//
//  Created by Pol Piella Abadia on 21/02/2021.
//

import Foundation

/// Helper method to execute a shell command
/// - Parameter args: Comma-separated arguments that constitute the shell command
/// - Returns: Termination status code for the performed operation
@discardableResult func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env/"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}
