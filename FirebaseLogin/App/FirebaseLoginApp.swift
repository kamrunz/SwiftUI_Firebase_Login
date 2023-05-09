//
//  FirebaseLoginApp.swift
//  FirebaseLogin
//
//  Created by Kamran Namazov on 02.05.23.
//

import SwiftUI
import Firebase

@main
struct FirebaseLoginApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
