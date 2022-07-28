//
//  Tools.swift
//  JoNotes WatchKit Extension
//
//  Created by Jose Daniel Corredor Zambrano on 28/07/22.
//

import Foundation

/*
 Este va a ser singleton, y se encargara de guardar las notas
 */

class Tools {
    let key: String = "NotesApp"
    //Esto es crear un singleton en Swift
    static let shared = Tools()
    
    private init(){}
    
    //Esto permite guardar info, pero solo la app puede recuperarla
//    UserDefaults.standard
    
    func save(array: [Note]){
        //Se usa try por que puede botar error
        let data = array.map{ try? JSONEncoder().encode($0)}
        UserDefaults.standard.setValue(data, forKey: key)
    }
    
    func Load() -> [Note] {
        guard let savedData = UserDefaults.standard.array(forKey: key) as? [Data] else{
            return []
        }
        return savedData.map{
            try! JSONDecoder().decode(Note.self, from: $0) // ese $0 es el "Data"
        }
    }
}
