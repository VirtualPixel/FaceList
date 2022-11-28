//
//  NewFace-ViewModel.swift
//  FaceList
//
//  Created by Justin Wells on 11/25/22.
//

import SwiftUI
import CoreImage

extension NewFace {
    @MainActor class ViewModel: ObservableObject {
        @Published var image: Image?
        @Published var name: String
        let locationFetcher = LocationFetcher()
        @Published var latitude: Double = 0
        @Published var longitude: Double = 0
                
        init(image: Image, name: String) {
            self.image = image
            self.name = name
            self.locationFetcher.start()
        }
        
        func saveImage(imageName: UUID) {
            let savePath = FileManager.documentsDirectory.appendingPathComponent("\(imageName)")
            
            let uiImage = ImageRenderer(content: image).uiImage
            
                
            if let jpegData = uiImage!.jpegData(compressionQuality: 0.8) {
                try? jpegData.write(to: savePath, options: [.atomic, .completeFileProtection])
            }
        }
        
        func setLocation() {
            if let location = self.locationFetcher.lastKnownLocation {
                self.latitude = location.latitude
                self.longitude = location.longitude
            } else {
                print("Couldn't save location.")
            }
        }
    }
}
