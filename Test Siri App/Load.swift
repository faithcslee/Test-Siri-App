//
//  Load.swift
//  Test Siri App
//
//  Created by Travis Wadman on 6/10/24.
//

 import Foundation

 struct KeyValue: Codable {
     let wellName: String
     let oil: Int
     let water: Int
 }

 class DataLoader {
     static let shared = DataLoader()

     func loadJSON() -> KeyValue? {
         if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
             do {
                 let data = try Data(contentsOf: url)
                 let decoder = JSONDecoder()
                 let jsonData = try decoder.decode(KeyValue.self, from: data)
                 return jsonData
             } catch {
                 print("Error decoding JSON: \(error)")
             }
         }
         return nil
     }
 }

// Trying to add UUID???? :

 /*
import Foundation

struct KeyValueEntry<T: Codable>: Codable {
    let value: T
    let id: UUID

    init(value: T) {
        self.value = value
        self.id = UUID()
    }
}

struct KeyValue: Codable {
    let wellName: KeyValueEntry<String>
    let oil: KeyValueEntry<String>
    let water: KeyValueEntry<String>

    enum CodingKeys: String, CodingKey {
        case wellName, oil, water
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        wellName = KeyValueEntry(value: try container.decode(String.self, forKey: .wellName))
        oil = KeyValueEntry(value: try container.decode(String.self, forKey: .oil))
        water = KeyValueEntry(value: try container.decode(String.self, forKey: .water))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(wellName.value, forKey: .wellName)
        try container.encode(oil.value, forKey: .oil)
        try container.encode(water.value, forKey: .water)
    }
}

class DataLoader {
    static let shared = DataLoader()
    
    func loadJSON() -> KeyValue? {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(KeyValue.self, from: data)
                return jsonData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return nil
    }
}

*/





