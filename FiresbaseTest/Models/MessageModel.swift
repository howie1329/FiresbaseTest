//
//  MessageModel.swift
//  FiresbaseTest
//
//  Created by Howard Thomas on 2/25/23.
//

import Foundation



struct Message:Hashable,Identifiable{
    
    var id:String
    var userID:String
    var title:String
    var body:String
}
