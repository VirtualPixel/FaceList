//
//  ContentView-ViewModel.swift
//  FaceList
//
//  Created by Justin Wells on 11/24/22.
//

import SwiftUI
import CoreData
import CoreImage

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Environment(\.managedObjectContext) var moc
        @FetchRequest(sortDescriptors: []) var savedFaces: FetchedResults<SavedFace>
        
        // image variables
        @Published var showingImagePicker = false
        @Published var inputImage: UIImage?
        @Published var image: Image = Image("example")
        
        @Published var showingNewFace = false
        
        func newImage() {
            showingImagePicker = true
        }
        
        func loadImage(url: URL) -> Image {
            do {
                let data = try Data(contentsOf: url)
                let loaded = UIImage(data: data)
                return Image(uiImage: loaded!)
            } catch {
                return Image("example")
            }
        }
    }
}
