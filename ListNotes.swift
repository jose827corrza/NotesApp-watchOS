//
//  ListNotes.swift
//  JoNotes WatchKit Extension
//
//  Created by Jose Daniel Corredor Zambrano on 27/07/22.
//

import SwiftUI

struct ListNotes: View {
    
    @State private var isActiveDetailNote: Bool = false
//    @State private var notes : [Note] = [Note(title: "uno"), Note(title: "dos")]
    @State private var notes = [Note]()
    
    var body: some View {
        VStack{
            
            Text("Notas actuales: \(notes.count)")
                .font(.system(size: 12))
                .foregroundColor(.blue)
            
            List{
                ForEach(notes, id: \.self.id){note in
                    
//                    NavigationLink(isActive: $isActiveDetailNote, destination: {
//                        DetailNote(note: note)
//                    }, label: {
//                        Text(note.title).lineLimit(1)
//                    })
                    
                    // Sirvio fue con esta forma, sin utilizar el isActive, quiza por lo que no esta en un NavigationView(?)
                    NavigationLink(destination: {
                        DetailNote(note: note)
                    }, label: {
                        Text(note.title)
                    })
                    
                    
                    
                    
                }.onDelete(perform: delete)
            }
            
            
        }
        .onAppear(perform: {
            //Este onApper ejecuta codigo cuando se esta armando la vista
            notes = Tools.shared.Load()
        })
        
    }
    func delete(offset: IndexSet){
        withAnimation{
            notes.remove(atOffsets: offset)
            //Esta es para borrar nuestra nota del arreglo de notas
            Tools.shared.save(array: notes)
        }
    }
    
}

struct ListNotes_Previews: PreviewProvider {
    static var previews: some View {
        ListNotes()
    }
}
