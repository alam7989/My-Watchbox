//
//  Entry.swift
//  My-Watchbox
//
//  Created by Audrey Lam on 11/16/23.
//

import Foundation

// The Entry model
struct Entry: Codable {

    var title: String
    var rating: String
    var note: String? // An optional note

    // Initialize a new entry
    // "note" property has default value if none is passed into the init by the caller
    init(title: String, rating: String, note: String? = nil) {
        self.title = title
        self.rating = rating
        self.note = note
    }

    // An id (Universal Unique Identifier) used to identify an entry
    var id: String = UUID().uuidString
}

// MARK: - Entry + UserDefaults
extension Entry {

    // Given an array of entries, encodes them to data and saves to UserDefaults.
    static func save(_ entries: [Entry]) {

        // TODO: Save the array of entries
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(entries)
        defaults.set(encodedData, forKey: "entriesKey")
}

    // Retrieve an array of saved tasks from UserDefaults.
    static func getEntries() -> [Entry] {
        
        // TODO: Get the array of saved entries from UserDefaults
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: "entriesKey"){
            let decodedContacts = try! JSONDecoder().decode([Entry].self, from: data)
            return decodedContacts
        } else {
            return []
        }

    }

    // Add a new entry or update an existing entry with the current entry.
    func save() {

        // TODO: Save the current entry
        print("imma save \(self)")
        var saved_entries = Entry.getEntries()
        
        saved_entries.append(self)
        
        
        Entry.save(saved_entries) // save the updated entries array to UserDefaults
        print("done saving")
    }
}
