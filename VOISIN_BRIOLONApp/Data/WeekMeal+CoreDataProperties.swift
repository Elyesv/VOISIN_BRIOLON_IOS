//
//  WeekMeal+CoreDataProperties.swift
//  VOISIN_BRIOLONApp
//
//  Created by Elyes Voisin on 10/01/2025.
//
//

import Foundation
import CoreData


extension WeekMeal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeekMeal> {
        return NSFetchRequest<WeekMeal>(entityName: "WeekMeal")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var ingredients: String?

}

extension WeekMeal : Identifiable {

}
