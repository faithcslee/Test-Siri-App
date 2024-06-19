//
//  KeyEntityQuery.swift
//  Test Siri App
//
//  Created by Travis Wadman on 6/11/24.
//




// Incorrect Entity Query code:



/*
import AppIntents
import Foundation
import OSLog

struct KeyEntityQuery: EntityQuery {

    func entities(for identifiers: [KeyEntity.ID]) async throws -> [KeyEntity] {
        let modelContext = ModelContext.getContextForAppIntents()
        let fetchDescriptor = FetchDescriptor<KeyDataModel>(
            predicate: #Predicate { identifiers.contains($0.id) }
        )
        
        return try modelContext
            .fetch(fetchDescriptor)
            .map(KeyEntity.init)
    }
}

*/











// More random code:


/*
struct KeyEntityQuery: EntityQuery {
    func entities(for identifiers: [UUID]) -> [Key] {
        // In a real app, you would fetch the messages from your data source
        return identifiers.compactMap { id in
            Key(id: id, key: key)
        }
    }

}
*/






/*
struct KeyEntityQuery: EntityQuery {

    func entities(for identifiers: [String]) async throws -> [KeyEntity] {
        // let keys = DataLoader.shared.loadJSON()
        // return keys
        
        var matchingKeys: [KeyEntity] = []
        
        for identifier in identifiers {
            if let matchingKey = getMatchingKey(identifier: identifier) {
                // Assuming KeyEntity has an initializer that takes a string
                let keyEntity = KeyEntity(key: matchingKey)
                matchingKeys.append(keyEntity)
            }
        }
        
        return matchingKeys
    }
}


func getMatchingKey(identifier: String) -> String? {
    let keyValueProperties = ["wellName", "oil", "water"]
    return keyValueProperties.contains(identifier) ? identifier : nil
}
*/






    //func suggestedEntities() async throws -> [KeyEntity] {
     
    //}
    
    
    /*
    func entities(for identifiers: [TrailEntity.ID]) async throws -> [TrailEntity] {
        Logger.entityQueryLogging.debug("[TrailEntityQuery] Query for IDs \(identifiers)")
        
        return trailManager.trails(with: identifiers)
                .map { TrailEntity(trail: $0) }
    }
    
    /**
     - Returns: The most likely choices relevant to the individual, such as the contents of a favorites list. The system displays these values as
     a list of options for the entities. For example, configuring the Get Trail Info intent in the Shortcuts app will show these values
     as suggestions for the trail parameter.
     
     - Tag: suggested_entities
     */
    func suggestedEntities() async throws -> [TrailEntity] {
        Logger.entityQueryLogging.debug("[TrailEntityQuery] Request for suggested entities")
        
        return trailManager.trails(with: trailManager.favoritesCollection.members)
                .map { TrailEntity(trail: $0) }
    }
}

/// An `EntityStringQuery` extends the capability of an `EntityQuery` by allowing people to search for an entity with a string.
extension TrailEntityQuery: EntityStringQuery {
    
    /**
     To see this method, configure the Get Trail Info intent in the Shortcuts app. A list displays the suggested entities.
     If you search for an entity not in the suggested entities list, the system passes the search string to this method.
     
     - Tag: string_query
     */
    func entities(matching string: String) async throws -> [TrailEntity] {
        Logger.entityQueryLogging.debug("[TrailEntityQuery] String query for term \(string)")
        
        return trailManager.trails { trail in
            trail.name.localizedCaseInsensitiveContains(string)
        }.map { TrailEntity(trail: $0) }
    }
     */

