//
//  SavedFace+CoreDataProperties.swift
//  FaceList
//
//  Created by Justin Wells on 11/26/22.
//
//

import Foundation
import CoreData


extension SavedFace {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedFace> {
        return NSFetchRequest<SavedFace>(entityName: "SavedFace")
    }

    @NSManaged public var name: String?
    @NSManaged public var imageName: UUID?
    
    var wrappedName: String {
        name ?? "UNKNOWN"
    }
    
    var wrappedImageName: UUID {
        imageName ?? UUID()
    }
    
    var savedPath: URL {
        FileManager.documentsDirectory.appendingPathComponent("\(wrappedImageName)")
    }

}

extension SavedFace : Identifiable {

}
