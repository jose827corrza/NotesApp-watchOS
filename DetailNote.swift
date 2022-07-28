//
//  DetailNote.swift
//  JoNotes WatchKit Extension
//
//  Created by Jose Daniel Corredor Zambrano on 27/07/22.
//

import SwiftUI

struct DetailNote: View {
    
    let note: Note
    
    var body: some View {
        VStack {
            Text(note.title)
                .font(.system(size: 20))
                .foregroundColor(.white)
            
            Text(note.createdDate)
                .font(.system(size: 12))
        }
    }
}

struct DetailNote_Previews: PreviewProvider {
    static var previews: some View {
        DetailNote(note: Note(title: "Prueba"))
    }
}
