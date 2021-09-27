//
//  Persistence.swift
//  LoginCoreData
//
//  Created by Anthony José on 24/09/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        func createData() {
            guard let userEntity = NSEntityDescription.entity(forEntityName: "UserEntity", in: viewContext) else { return }
            
            for i in 1...5 {
                let user = NSManagedObject(entity: userEntity, insertInto: viewContext)
            }
        
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "User")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
            
            container.loadPersistentStores(completionHandler: { (sortDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
        }
    }
}
