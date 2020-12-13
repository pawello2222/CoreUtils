//
//  ManagedEntity.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import CoreData

public protocol ManagedEntity: NSFetchRequestResult {}

public extension ManagedEntity where Self: NSManagedObject {
    static var entityName: String {
        let nameMO = String(describing: Self.self)
        return nameMO.replacingOccurrences(of: "MO", with: "")
    }

    static func insertNew(in context: NSManagedObjectContext) -> Self? {
        NSEntityDescription
            .insertNewObject(forEntityName: entityName, into: context) as? Self
    }

    static func newFetchRequest(predicate: NSPredicate? = nil) -> NSFetchRequest<Self> {
        let fetchRequest = NSFetchRequest<Self>(entityName: entityName)
        fetchRequest.predicate = predicate
        return fetchRequest
    }

    static func newBatchDeleteRequest(predicate: NSPredicate? = nil) -> NSBatchDeleteRequest {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = predicate
        return .init(fetchRequest: fetchRequest)
    }
}
