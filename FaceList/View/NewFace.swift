//
//  NewFace.swift
//  FaceList
//
//  Created by Justin Wells on 11/25/22.
//

import SwiftUI

struct NewFace: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                viewModel.image?
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(.roundedBorder)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        save()
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
    
    init(image: Image) {
        _viewModel = StateObject(wrappedValue: ViewModel(image: image, name: "Default"))
    }
    
    func save() {
        let cachedFace = SavedFace(context: moc)
        cachedFace.name = viewModel.name
        cachedFace.imageName = UUID()
        
        viewModel.saveImage(imageName: cachedFace.wrappedImageName)
        
        try? moc.save()
    }
}

struct NewFace_Previews: PreviewProvider {
    static var previews: some View {
        NewFace(image: Image("example"))
    }
}

