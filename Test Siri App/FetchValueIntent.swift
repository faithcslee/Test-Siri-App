//
//  FetchValueIntent.swift
//  Test Siri App
//
//  Created by Travis Wadman on 6/11/24.
//



// Current app intent code:
//      Working: Runs as an app shortcut in the shortcuts app
//      Issues: siri and app shortcut provider do not work
//              "key" needs to be properly parameterized for app shortcut provider and siri to work




import AppIntents

struct FetchValueIntent: AppIntent {
    static var title: LocalizedStringResource = "Fetch Value by Key"
    static var description = IntentDescription("Fetches the value for a given key from a JSON file.")

    @Parameter(title: "Key")
    var key: String

    static var parameterSummary: some ParameterSummary {
        Summary("Fetch value for \(\.$key)")
    }
    
    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<String> & ProvidesDialog{
        guard let data = DataLoader.shared.loadJSON() else {
            throw NSError(domain: "FetchValueIntent", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to load JSON data."])
        }

        let value: String
        switch key {
        case "wellName":
            value = data.wellName
        case "oil":
            value = String(data.oil)
        case "water":
            value = String(data.water)
        default:
            throw NSError(domain: "FetchValueIntent", code: 2, userInfo: [NSLocalizedDescriptionKey: "Invalid key."])
        }

        let dialog = IntentDialog(full: "value for \(key) is \(value).", supporting: "The value for \(key) is \(value).")

        return .result(value: value, dialog: dialog)
    }
}


// Trying to handle parameters as entities:

// defining key as a KeyEntity in line 58


/*
import AppIntents

struct FetchValueIntent: AppIntent {
    static var title: LocalizedStringResource = "Fetch Value by Key"
    static var description = IntentDescription("Fetches the value for a given key from a JSON file.")

    @Parameter(title: "Key")
    var key: KeyEntity

    static var parameterSummary: some ParameterSummary {
        Summary("Fetch value for \(\.$key)")
    }
    
    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<String> & ProvidesDialog{
        guard let data = DataLoader.shared.loadJSON() else {
            throw NSError(domain: "FetchValueIntent", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to load JSON data."])
        }

        let value: String
        switch key {
        case "wellName":
            value = data.wellName
        case "oil":
            value = data.oil
        case "water":
            value = data.water
        default:
            throw NSError(domain: "FetchValueIntent", code: 2, userInfo: [NSLocalizedDescriptionKey: "Invalid key."])
        }

        let dialog = IntentDialog(full: "value for \(key) is \(value).", supporting: "The value for \(key) is \(value).")

        return .result(value: value, dialog: dialog)
    }
}
*/


