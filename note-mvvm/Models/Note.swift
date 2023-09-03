//
//  Note.swift
//  note-mvvm
//
//  Created by Deanira Fadrinaldi on 24/08/23.
//

import Foundation

// Model
struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
}
