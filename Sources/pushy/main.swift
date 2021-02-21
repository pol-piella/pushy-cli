import Files
import Foundation
import ArgumentParser

struct Pushy: ParsableCommand {
    @Argument(help: "Identifier for your application") var bundleIdentifier: String
    @Option(name: .shortAndLong, help: "The title for the push notification") var title: String
    @Option(name: .shortAndLong, help: "The Subtitle for the push notification") var subtitle: String
    @Option(name: .shortAndLong, help: "The Body for the push notification") var body: String
    
    func run() throws {
        let directory = NSTemporaryDirectory()
        let folder = try Folder(path: directory)
        let file = try folder.createFile(at: "push-test.apns")
        let aps = Aps(alert: Alert(title: title, subtitle: subtitle, body: body, launchImage: "", titleLocKey: "", subtitleLocArgs: "", locKey: "", locArgs: ""),
                      badge: 10,
                      sound: Sound(critical: 1, name: "", volume: "0.5"),
                      category: "",
                      contentAvailable: 1,
                      mutableContent: 1)
        let pushBody = PushBody(bundleIdentifier: "com.studentbeans.studentbeans", aps: aps)
        let data = try JSONEncoder().encode(pushBody)
        try file.write(data)
    }
}

Pushy.main(["test", "--title", "hello", "--subtitle", "world", "--body", "someStuff"])
