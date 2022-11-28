//
//  SavedFace+CoreDataProperties.swift
//  FaceList
//
//  Created by Justin Wells on 11/28/22.
//
//

import Foundation
import CoreData
import CoreLocation


extension SavedFace {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedFace> {
        return NSFetchRequest<SavedFace>(entityName: "SavedFace")
    }

    @NSManaged public var imageName: UUID?
    @NSManaged public var name: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

    var wrappedName: String {
        name ?? "UNKNOWN"
    }
    
    var wrappedImageName: UUID {
        imageName ?? UUID()
    }
    
    var savedPath: URL {
        FileManager.documentsDirectory.appendingPathComponent("\(wrappedImageName)")
    }
    
    var savedLocation: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

extension SavedFace : Identifiable {

}
