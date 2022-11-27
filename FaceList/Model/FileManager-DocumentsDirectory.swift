//
//  FileManager-DocumentsDirectory.swift
//  FaceList
//
//  Created by Justin Wells on 11/27/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
