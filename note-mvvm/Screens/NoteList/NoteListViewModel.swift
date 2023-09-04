//
//  NotesListViewModel.swift
//  note-mvvm
//
//  Created by Deanira Fadrinaldi on 24/08/23.
//

import Foundation
import Combine

class NoteListViewModel: ObservableObject {
    @Published var notes: [Note]
    @Published var showAddView = false
    @Published var selectedNote: Note?
    
    var noteController: NoteController
    
    private var cancellables = Set<AnyCancellable>()
    
    init(noteController: NoteController) {
        self.noteController = noteController
        
        notes = noteController.notes
        self.showAddView = showAddView
        self.selectedNote = selectedNote
        
        noteController.$notes.sink { [weak self] in
            self?.notes = $0
        }
        .store(in: &cancellables)
    }
}
