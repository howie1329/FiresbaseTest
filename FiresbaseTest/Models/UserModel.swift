//
//  UserModel.swift
//  FiresbaseTest
//
//  Created by Howard Thomas on 2/25/23.
//

import Foundation

struct User: Hashable, Identifiable{
    
    var id: String
    var messages: [Message]
}
