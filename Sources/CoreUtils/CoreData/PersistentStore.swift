//
//  PersistentStore.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import CoreData

protocol PersistentStore {
    typealias DBOperation<Result> = (NSManagedObjectContext) throws -> Result

    func fetch<T, V>(_ request: NSFetchRequest<T>, map: @escaping (T) -> V?) -> [V] where T: ManagedEntity
    func delete(_ request: NSBatchDeleteRequest)
    func save(_ operation: @escaping DBOperation<Void>)
    func loadContainer(useCloudSync: Bool)
}
