//
//  Push.swift
//  
//
//  Created by Pol Piella Abadia on 21/02/2021.
//

import Foundation
import ArgumentParser
import Files
import XCRunner

struct Push: ParsableCommand {
    @Argument(help: "Identifier for your application")
    var bundleIdentifier: String
    @Option(name: .long, help: "The title for the push notification")
    var title: String?
    @Option(name: .long, help: "The Subtitle for the push notification")
    var subtitle: String?
    @Option(name: .long, help: "The Body for the push notification")
    var body: String?
    @Option(name: .long, help: "The number to display for the badge icon")
    var badge: Int?
    @Option(name: .long, help: "The image passed to the payload")
    var image: String?
    @Option(name: .long, help: "Name of the sound to be played with the notification")
    var soundName: String?
    @Option(name: .long, help: "Volume between 0.0 and 1.0 for the notification")
    var soundVolume: Double?
    @Option(name: .long, help: "Category")
    var category: String?
    @Flag(help: "Defines the option to perform a silent push, will ignore the alert and badge fields")
    var silent: Bool = false
    @Flag(help: "The notification service app extension flag. If the value is 1, the system passes the notification to your notification service app extension before delivery.")
    var mutableContent: Bool = false
    
    
    func run() throws {
        let directory = NSTemporaryDirectory()
        let folder = try Folder(path: directory)
        let file = try folder.createFile(at: "push.apns")
        let alert = silent ? nil : Alert(title: title, subtitle: subtitle, body: body, launchImage: image)
        let aps = Aps(alert: alert,
                      badge: silent ? nil : badge,
                      sound: Sound(name: soundName, volume: soundVolume),
                      category: category,
                      contentAvailable: silent ? 1 : 0,
                      mutableContent: mutableContent ? 1 : 0)
        let data = try JSONEncoder().encode(PushBody(aps: aps))
        try file.write(data)
        XCRunner.execute(.push(device: "booted", identifier: bundleIdentifier, filePath: file.path))
        try file.delete()
    }
}
