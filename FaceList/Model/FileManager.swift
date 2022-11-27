//
//  FileManager.swift
//  FaceList
//
//  Created by Justin Wells on 11/27/22.
//

import Foundation

extension FileManager {
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for the user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // send back the first one, this ought to be the only one
        return paths[0]
    }
}
