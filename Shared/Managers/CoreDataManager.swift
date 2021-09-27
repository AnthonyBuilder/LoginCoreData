//
//  CoreDataManager.swift
//  LoginCoreData (iOS)
//
//  Created by Anthony José on 27/09/21.
//

import CoreData
import SwiftUI

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "User")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    func getAllUsers() -> [UserEntity] {
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func save(email: String, password: String) {
        let user = UserEntity(context: persistentContainer.viewContext)
        
        user.id = UUID()
        user.email = email
        user.password = password
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed save user \(error)")
        }
    }
}
