//
//  ViewModelFactory.swift
//  note-mvvm
//
//  Created by Deanira Fadrinaldi on 02/09/23.
//

import Foundation

class ViewModelFactory: ObservableObject {
    let noteController = NoteController()
    
    func makeNoteAddUpdateViewModel(note: Note?) -> NoteAddUpdateViewModel {
        return NoteAddUpdateViewModel(note: note, noteController: noteController)
    }
    
    func makeNoteDetailViewModel(note: Note) -> NoteDetailViewModel {
        return NoteDetailViewModel(note: note, noteController: noteController)
    }
    
    func makeNoteListViewModel() -> NoteListViewModel {
        return NoteListViewModel(noteController: noteController)
    }
}
