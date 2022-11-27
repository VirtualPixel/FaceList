//
//  User.swift
//  FaceList
//
//  Created by Justin Wells on 11/25/22.
//

import SwiftUI

struct Face: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    var name: String
    var image: Image?
    
    static let example = Face(name: "Tom", image: Image("example"))
}
