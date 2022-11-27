//
//  FaceListApp.swift
//  FaceList
//
//  Created by Justin Wells on 11/24/22.
//

import SwiftUI

@main
struct FaceListApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
