//
//  DataModel.swift
//  FiresbaseTest
//
//  Created by Howard Thomas on 2/25/23.
//

import Foundation
import Firebase
import FirebaseAuth


class DataModel: ObservableObject{
    
    @Published var messages: [Message] = []
    @Published var currentUserID:String = ""
    @Published var signInStatus:Bool = false
    
    func createUser(email:String,password:String){
        Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func signInUser(email:String,password:String) {
        
        Auth.auth().signIn(withEmail: email, password: password){result,error in
            
            if error == nil{
                self.signInStatus.toggle()
                self.currentUserID = (result?.user.uid)!
            }
        }
        
    }
    
    func signOutUser(){
        do{
            try Auth.auth().signOut()
        }
        catch{
            print(error)
        }
        
        self.currentUserID = ""
        self.signInStatus.toggle()
    }
    
    func getMessages(userID:String){
        let db = Firestore.firestore()
        
        let collection = db.collection("Main")
        
        collection.getDocuments { (snapShot, error) in
            
            if error == nil{
                
                var allMessages: [Message] = []
                if let snapShot = snapShot{
                    
                    for doc in snapShot.documents{
                        
                        let data = doc.data()
                        
                        let id = doc.documentID
                        let userID = data["id"] as? String ?? ""
                        
                        let title = data["title"] as? String ?? ""
                        let body = data["body"] as? String ?? ""
                        
                        allMessages.append(Message(id: id,userID: userID, title: title, body: body))
                    }
                    
                    self.messages = allMessages
                    
                }
            } else{
                print("Error")
            }
        }
    }
    
    func createMessage(message:Message){
        
        let db = Firestore.firestore()
        
        let collection = db.collection("Main")
        
        collection.document().setData(["id":message.userID,"title":message.title,"body":message.body])
    }
    
    
}
