//
//  Faces.swift
//  FaceList
//
//  Created by Justin Wells on 11/25/22.
//

import SwiftUI

class Faces: ObservableObject {
    @Published var list = [Face]()
    
    init() {
        //self.list = [Face(name: "Bob", image: Image("example")), Face(name: "Tim", image: Image("example"))]
    }
}
