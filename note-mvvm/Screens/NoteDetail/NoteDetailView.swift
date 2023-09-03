//
//  NoteDetailView.swift
//  note-mvvm
//
//  Created by Deanira Fadrinaldi on 24/08/23.
//

import SwiftUI

struct NoteDetailView: View {
    @ObservedObject var viewModel: NoteDetailViewModel
    @EnvironmentObject var viewModelFactory: ViewModelFactory
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title)
            
            Text(viewModel.content)
                .padding()
            
            Button("Edit") {
                viewModel.showEditView.toggle()
            }
            
            Button("Delete") {
                viewModel.deleteNote()
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarTitle("Note Detail")
        .sheet(isPresented: $viewModel.showEditView) {
            NavigationView {
                NoteAddEditView(viewModel: viewModelFactory.makeNoteAddEditViewModel(note: viewModel.getNote()), isPresented: $viewModel.showEditView)
                    .navigationBarItems(
                        leading:
                            Button("Cancel") {
                                viewModel.showEditView = false
                            }
                    )
            }
        }
    }
}
