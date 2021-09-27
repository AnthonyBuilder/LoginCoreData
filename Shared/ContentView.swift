//
//  ContentView.swift
//  Shared
//
//  Created by Anthony José on 24/09/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    let coreDataManager: CoreDataManager
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    
//  NOT RECOMEND USE VIEW CALL DIRECT ON COREDATA
    @State private var users: [UserEntity] = [UserEntity]()
    
//  @Environment(\.managedObjectContext) private var viewContext
//  @FetchRequest(entity: UserEntity.entity(), sortDescriptors: []) var users: FetchedResults<UserEntity>

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                coreDataManager.save(email: email, password: password)
            }) {
                Text("Save")
            }
            
            List(users, id: \.self) { user in
                Text(user.email!)
            }
        }.onAppear(perform: {
            users = coreDataManager.getAllUsers()
        })
        
//        VStack {
//            ForEach(users) { user in
//                Text(user.email!)
//            }
//        }
    }
}

