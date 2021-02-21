import Foundation
import ArgumentParser

struct Pushy: ParsableCommand {
    static let configuration: CommandConfiguration = CommandConfiguration(abstract: "Use push to send a notification to your simulator",
                                                                          subcommands: [Push.self])
}

Pushy.main()
