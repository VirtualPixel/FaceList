//
//  UserDetailView.swift
//  FaceList
//
//  Created by Justin Wells on 11/25/22.
//

import SwiftUI

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
        }
    }
    
    init(face: SavedFace) {
        _viewModel = StateObject(wrappedValue: ViewModel(face: face))
    }
}
