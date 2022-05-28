//
//  NotesData.swift
//  ONWE
//
//  Created by Yanika Telus on 5/23/22.
//

import Foundation
import SwiftUI

struct Note : Codable, Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var timeStamp: String
    var emoticon: String
}

@MainActor class Notes : ObservableObject {
    private let NOTES_KEY = "NotesKey"
    var notes: [Note] {
        didSet {
            saveData()
            objectWillChange.send()
        }
    }
    
    init() {
        // Load saved data
        if let data = UserDefaults.standard.data(forKey: NOTES_KEY) {
            if let decodedNotes = try? JSONDecoder().decode([Note].self, from: data) {
                notes = decodedNotes
                return
            }
        }
        // Tutorial Note
        notes = [Note(title: "Test Note", content: "Click on the 'I'm Feeling' button to add a new journal entry! \n <-Swipe left to delete notes", timeStamp: formatDate(NSDate().timeIntervalSince1970), emoticon: "happy")]
    }
    
    func addNote(title: String, content: String, emoticon: String) {
        let tempNote = Note(title: title, content: content, timeStamp: formatDate(NSDate().timeIntervalSince1970), emoticon: emoticon)
        notes.insert(tempNote, at: 0)
        saveData()
    }
    
    // Save data
    private func saveData() {
        if let encodedNotes = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encodedNotes, forKey: NOTES_KEY)
        }
    }
}

