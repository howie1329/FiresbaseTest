//
//  FiresbaseTestApp.swift
//  FiresbaseTest
//
//  Created by Howard Thomas on 2/24/23.
//

import SwiftUI
import Firebase
import FirebaseAuth


@main
struct FiresbaseTestApp: App {
    
    init(){
        
        FirebaseApp.configure()
        
        
    }

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataModel())
        }
    }
}
