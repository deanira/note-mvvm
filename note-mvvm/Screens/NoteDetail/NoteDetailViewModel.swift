//
//  NoteDetailViewModel.swift
//  note-mvvm
//
//  Created by Deanira Fadrinaldi on 24/08/23.
//

import Foundation

class NoteDetailViewModel: ObservableObject {
    let title: String
    let content: String
    private let note: Note
    private let noteController: NoteController
    @Published var showEditView = false
    
    init(note: Note, noteController: NoteController) {
        title = note.title
        content = note.content
        self.note = note
        self.noteController = noteController
    }
    
    func getNote() -> Note {
        note
    }
    
    func deleteNote() {
        noteController.deleteNote(note)
    }
}
