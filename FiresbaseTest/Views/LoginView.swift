//
//  LoginView.swift
//  FiresbaseTest
//
//  Created by Howard Thomas on 2/25/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var model:DataModel
    
    var body: some View {
        Button {
            model.signInUser(email: "test@test.com", password: "pass123")
        } label: {
            Text("Sign in")
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(DataModel())
    }
}
