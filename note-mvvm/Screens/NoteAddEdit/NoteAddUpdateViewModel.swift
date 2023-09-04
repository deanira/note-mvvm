//
//  NoteEditViewModel.swift
//  note-mvvm
//
//  Created by Deanira Fadrinaldi on 24/08/23.
//

import Foundation

class NoteAddUpdateViewModel: ObservableObject {
    @Published var title = ""
    @Published var content = ""
    @Published var note: Note?
    
    var noteController: NoteController
    
    init(note: Note?, noteController: NoteController) {
        self.note = note
        self.noteController = noteController
        self.title = note?.title ?? ""
        self.content = note?.content ?? ""
    }
    
    func addOrUpdateNote() {
        noteController.addOrUpdateNote(note!)
    }
}
