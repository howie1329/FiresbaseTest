//
//  StartView.swift
//  FiresbaseTest
//
//  Created by Howard Thomas on 2/25/23.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var model:DataModel
    var body: some View {
        if model.signInStatus{
            ContentView()
        }
        else{
            LoginView()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(DataModel())
    }
}
