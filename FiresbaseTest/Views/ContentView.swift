//
//  ContentView.swift
//  FiresbaseTest
//
//  Created by Howard Thomas on 2/24/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @EnvironmentObject var model:DataModel
    
    
    var body: some View {
        VStack {
            
            Button {
                model.createMessage(message: Message(id: "test",userID: model.currentUserID, title: "Title1", body: "Body1"))
            } label: {
                Text("Create Message")
            }
            
            Button {
                model.getMessages(userID: model.currentUserID)
                
                print(model.messages)
            } label: {
                Text("Get Message")
            }
            
            Button {
                model.signOutUser()
            } label: {
                Text("Sign Out")
            }

        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataModel())
    }
}
