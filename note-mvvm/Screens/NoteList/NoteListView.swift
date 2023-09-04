//
//  NotesListView.swift
//  note-mvvm
//
//  Created by Deanira Fadrinaldi on 24/08/23.
//

import SwiftUI

struct NoteListView: View {
    @ObservedObject var viewModel: NoteListViewModel
    @EnvironmentObject var viewModelFactory: ViewModelFactory
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.notes) { note in
                    NavigationLink(destination: NoteDetailView(viewModel: viewModelFactory.makeNoteDetailViewModel(note: note))) {
                        Text(note.title)
                    }
                }
                
                Button(action: {
                    viewModel.selectedNote = nil
                    viewModel.showAddView.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Note")
                }
            }
            .navigationBarTitle("Notes")
        }
        .sheet(isPresented: $viewModel.showAddView) {
            NavigationView {
                NoteAddUpdateView(viewModel: viewModelFactory.makeNoteAddUpdateViewModel(note: viewModel.selectedNote), isPresented: $viewModel.showAddView)
                    .navigationBarItems(
                        leading:
                            Button("Cancel") {
                                viewModel.showAddView = false
                            }
                    )
            }
        }
        .environmentObject(viewModel)
    }
}
