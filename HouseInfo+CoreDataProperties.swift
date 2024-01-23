//
//  HouseInfo+CoreDataProperties.swift
//  propertyKing
//
//  Created by Waiyi on 20/1/2024.
//
//

import Foundation
import CoreData


extension HouseInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HouseInfo> {
        return NSFetchRequest<HouseInfo>(entityName: "HouseInfo")
    }

    @NSManaged public var area: String?
    @NSManaged public var easte: String?
    @NSManaged public var hsetype: String?
    @NSManaged public var price: String?
    @NSManaged public var sell: String?
    @NSManaged public var timestamp: Date?

}

extension HouseInfo : Identifiable {

}
