//
//  ContentView.swift
//  FaceList
//
//  Created by Justin Wells on 11/24/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var savedFaces: FetchedResults<SavedFace>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(savedFaces) { face in
                    NavigationLink {
                        FaceDetailView(face: face)
                    } label: {
                        HStack {
                            viewModel.loadImage(url: face.savedPath)
                             .resizable()
                             .clipShape(Circle())
                             .padding(.horizontal, 5)
                             .frame(maxWidth: 60, maxHeight: 40)
                            Text(face.wrappedName)
                        }
                    }
                }
                .onDelete(perform: removeFace)
            }
            .navigationTitle("FaceList")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.newImage()
                    } label: {
                        Image( systemName: "plus")
                    }
                    .onChange(of: viewModel.inputImage) { _ in viewModel.showingNewFace = true}
                    .sheet(isPresented: $viewModel.showingImagePicker) {
                        //ImagePicker(sourceType: .camera, image: $viewModel.inputImage)
                        ImagePicker(image: $viewModel.inputImage)
                    }
                    .sheet(isPresented: $viewModel.showingNewFace) {
                        NewFace(image: Image(uiImage: viewModel.inputImage!))
                    }
                }
            }
        }
    }
    
    func removeFace(at offsets: IndexSet) {
        for index in offsets {
            let face = savedFaces[index]
            try? FileManager.default.removeItem(at: savedFaces[index].savedPath)
            moc.delete(face)
        }
                
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
