//
//  NoteEditView.swift
//  note-mvvm
//
//  Created by Deanira Fadrinaldi on 24/08/23.
//

import SwiftUI

struct NoteAddEditView: View {
    @ObservedObject var viewModel: NoteAddEditViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $viewModel.title)
                TextField("Content", text: $viewModel.content)
            }

            Section {
                HStack {
                    Spacer()
                    Button("Save") {
                        if viewModel.note != nil {
                            viewModel.note?.title = viewModel.title
                            viewModel.note?.content = viewModel.content
                        } else {
                            let newNote = Note(
                                title: viewModel.title.isEmpty ? "Untitled" : viewModel.title,
                                content: viewModel.content
                            )
                            viewModel.note = newNote
                        }
                        viewModel.addOrUpdateNote()
                        isPresented.toggle()
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            if let note = viewModel.note {
                viewModel.title = note.title
                viewModel.content = note.content
            }
        }
        .navigationBarTitle(viewModel.note == nil ? "Add Note" : "Edit Note")
    }
}
