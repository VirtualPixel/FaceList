//
//  UserDetailView.swift
//  FaceList
//
//  Created by Justin Wells on 11/25/22.
//

import SwiftUI
import MapKit

struct FaceDetailView: View {
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        VStack {
            viewModel.image
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
            
            Text(viewModel.face.wrappedName)
                .font(.largeTitle.bold())
                .padding()
            
            Section {
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) {_ in
                    MapMarker(coordinate: viewModel.face.savedLocation)
                }
            } header: {
                Text("Meeting location")
            }
        }
    }
    
    init(face: SavedFace) {
        _viewModel = StateObject(wrappedValue: ViewModel(face: face))
    }
}
