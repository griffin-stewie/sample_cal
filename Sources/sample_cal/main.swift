import Foundation
import ArgumentParser

struct MainCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "sample_cal",
        abstract: "This is sample",
        version: "0.1.0",
        subcommands: [DescriptionCommand.self]
    )
}

struct DescriptionCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "description",
        abstract: "Print description of options"
    )

    @OptionGroup()
    var options: DescriptionCommandOptions

    func run() throws {
        print(options)
    }
}

struct DescriptionCommandOptions: ParsableArguments {
    @Option(name: [.customLong("start-date")], help: ArgumentHelp("Start date in format 'yyyy/MM/dd_HH:mm:ss' as defined by Unicode version tr35-31", valueName: "Self.dateFormat"), transform: { (string) throws -> Date in
        print("given value: \(string)")
        return Date()
    })
    var start: Date

    @Option()
    var name: String
}


MainCommand.main()
