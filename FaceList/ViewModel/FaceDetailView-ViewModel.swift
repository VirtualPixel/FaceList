//
//  FaceDetailView-ViewModel.swift
//  FaceList
//
//  Created by Justin Wells on 11/27/22.
//

import SwiftUI
import MapKit

extension FaceDetailView {
    @MainActor class ViewModel: ObservableObject {
        @Published var image: Image
        @Published var face: SavedFace
        @Published var mapRegion: MKCoordinateRegion
        @Published var locations: [Location]
        private var location: Location
        
        init(face: SavedFace) {
            self.face = face
            
            do {
                let data = try Data(contentsOf: face.savedPath)
                let loaded = UIImage(data: data)
                image = Image(uiImage: loaded!)
            } catch {
                image = Image("example")
            }
            
            mapRegion = MKCoordinateRegion(center: face.savedLocation, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            
            location = Location(name: "Met", coordinate: face.savedLocation)
            locations = [location]
        }
        
        func printLocation() {
            print(mapRegion.center)
            print("lat: \(face.latitude) long: \(face.longitude)")
        }
    }
}
