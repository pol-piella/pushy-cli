//
//  Pushy.swift
//  
//
//  Created by Pol Piella Abadia on 21/02/2021.
//

import ArgumentParser

struct Pushy: ParsableCommand {
    static let configuration: CommandConfiguration = CommandConfiguration(abstract: "Use push to send a notification to your simulator",
                                                                          subcommands: [Push.self])
}
