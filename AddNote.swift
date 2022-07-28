//
//  AddNote.swift
//  JoNotes WatchKit Extension
//
//  Created by Jose Daniel Corredor Zambrano on 27/07/22.
//

import SwiftUI

struct AddNote: View {
    
    @State private var title: String = ""
    @State private var notes = [Note]()
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        VStack{
            
            TextField("note", text: $title)
            
            Button("ADD NOTE"){
                guard title.isEmpty == false else {
                    return
                }
                print("test botton")
//                let note = Note(title: "es una prueba con guard true")
                let note = Note(title: title)
                print("oprimo")
                notes.append(note)
                Tools.shared.save(array: notes) // Esto guarda en memoria
                title = ""
                presentation.wrappedValue.dismiss()
                //Esta ultima linea hace que cuando se termine todo lo del boton, se devuelva al ContentView
            }
            
        }
        .onAppear(perform: {
            // Para que no reescriba tooodo nuestro array siempreque guarda
            print("apareciendo add note")
            notes = Tools.shared.Load()
        })
    }
}

struct AddNote_Previews: PreviewProvider {
    static var previews: some View {
        AddNote()
    }
}
