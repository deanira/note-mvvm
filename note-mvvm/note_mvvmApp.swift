//
//  note_mvvmApp.swift
//  note-mvvm
//
//  Created by Deanira Fadrinaldi on 24/08/23.
//

import SwiftUI

@main
struct note_mvvmApp: App {
    let viewModelFactory = ViewModelFactory()
    
    var body: some Scene {
        WindowGroup {
            NoteListView(viewModel: viewModelFactory.makeNoteListViewModel())
                .environmentObject(viewModelFactory)
        }
    }
}
