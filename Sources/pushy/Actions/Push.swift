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
    @Option(name: .long, help: "The title for the push notification") var title: String?
    @Option(name: .long, help: "The Subtitle for the push notification") var subtitle: String?
    @Option(name: .long, help: "The Body for the push notification") var body: String?
    @Option(name: .long, help: "The number to display for the badge icon") var badge: Int?
    @Option(name: .long, help: "Name of the sound to be played with the notification") var soundName: String?
    @Option(name: .long, help: "Volume between 0.0 and 1.0 for the notification") var soundVolume: Double?
    @Option(name: .long, help: "Category") var category: String?
    
    
    func run() throws {
        let directory = NSTemporaryDirectory()
        let folder = try Folder(path: directory)
        let file = try folder.createFile(at: "push.apns")
        let aps = Aps(alert: Alert(title: title, subtitle: subtitle, body: body, launchImage: nil),
                      badge: badge,
                      sound: Sound(name: soundName, volume: soundVolume),
                      category: category,
                      contentAvailable: nil,
                      mutableContent: nil)
        let data = try JSONEncoder().encode(PushBody(aps: aps))
        try file.write(data)
        shell(.push, values: bundleIdentifier, file.path)
        try file.delete()
    }
}
