//
//  Push.swift
//  
//
//  Created by Pol Piella Abadia on 21/02/2021.
//

import Foundation
import ArgumentParser
import Files

struct Push: ParsableCommand {
    @Argument(help: "Identifier for your application") var bundleIdentifier: String
    @Option(name: .shortAndLong, help: "The title for the push notification") var title: String
    @Option(name: .shortAndLong, help: "The Subtitle for the push notification") var subtitle: String
    @Option(name: .shortAndLong, help: "The Body for the push notification") var body: String
    @Option(name: .shortAndLong, help: "The number to display for the badge icon") var iconBadge: Int
    
    func run() throws {
        let directory = NSTemporaryDirectory()
        let folder = try Folder(path: directory)
        let file = try folder.createFile(at: "push-test.apns")
        let apsBody = Aps(alert: Alert(title: title, subtitle: subtitle, body: body), badge: iconBadge)
        let data = try JSONEncoder().encode(PushBody(aps: apsBody))
        try file.write(data)
        shell("xcrun", "simctl", "push", "booted", bundleIdentifier, file.path)
        try file.delete()
    }
}
