//
//  ContentView.swift
//  JoNotes WatchKit Extension
//
//  Created by Jose Daniel Corredor Zambrano on 27/07/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {

//        NavigationView{
            
        VStack(alignment: .center){
                    NavigationLink( destination: {
                        AddNote()
                    }, label: {
                        Text("ADD NOTE")
                    })
                    
                    NavigationLink( destination: {
                        ListNotes()
                    }, label: {
                        Text("LIST NOTES")
                    })
                    
                    
            }.navigationTitle("NotesApp")
        
//        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
