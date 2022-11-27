//
//  FaceDetailView-ViewModel.swift
//  FaceList
//
//  Created by Justin Wells on 11/27/22.
//

import SwiftUI

extension FaceDetailView {
    @MainActor class ViewModel: ObservableObject {
        @Published var image: Image
        @Published var face: SavedFace
        
        init(face: SavedFace) {
            self.face = face
            
            do {
                let data = try Data(contentsOf: face.savedPath)
                let loaded = UIImage(data: data)
                image = Image(uiImage: loaded!)
            } catch {
                image = Image("example")
            }
        }
    }
}
