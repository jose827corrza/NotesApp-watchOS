//
//  Note.swift
//  JoNotes WatchKit Extension
//
//  Created by Jose Daniel Corredor Zambrano on 27/07/22.
//

import Foundation

struct Note: Identifiable, Codable {
    var id: UUID
    var title: String
    var createdDate: String
    
    //Un constructor puntual, que solo nos permita poner titulo, lo demas se encarga el script
    init(title:String){
        self.id = UUID()
        self.title = title
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        
        self.createdDate = dateFormatter.string(from: date)
    }
}
