//
//  NoteController.swift
//  note-mvvm
//
//  Created by Deanira Fadrinaldi on 02/09/23.
//

import Foundation

class NoteController: ObservableObject {
    @Published private(set) var notes: [Note] = []
    
    func addOrUpdateNote(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note
        } else {
            notes.append(note)
        }
    }
    
    func deleteNote(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes.remove(at: index)
        }
    }
}
