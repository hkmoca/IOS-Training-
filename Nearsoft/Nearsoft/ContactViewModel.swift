//
//  UserViewModel.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 21/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit
import RealmSwift

class ContactViewModel {
    
    static let realm = try! Realm()
    var people = [User]()
    var interns = [User]()
    let nsModel = ContactManager()
    let realm = try! Realm()
    
    static func getIDToken() -> String {
       let persons = realm.objects(User.self)
        let user = persons[0] as User
        return user.idToken
    }
    
    func displayPeople(completion: (people: [User]) -> Void, failure: (error: NSError) -> Void){
       
        let persons = self.realm.objects(User.self)
        let loggedUser = persons[0] as User
        let idToken = ContactViewModel.getIDToken()
        var profileUser = User()
        
         nsModel.showEmployees({ (Employees) in
            
            
            
                self.people = Employees
                self.displayInterns({ (interns) in
                self.people.appendContentsOf(interns)
                self.people = self.people.sort { $0.fullName < $1.fullName }
                    
                    profileUser = self.people.filter { nearsoftian in
                    return nearsoftian.email == loggedUser.email
                    }.first!
                
                    profileUser.idToken = idToken
                
                try! self.realm.write {
                    self.realm.add(profileUser, update: true)
                }
                
                
            completion(people: self.people)
                
            })
            
            }, onFailure: { (error) in
                failure(error: error)
                
            }
        )
    }
    
    func displayInterns(completion: (interns: [User]) -> Void) {
        
         nsModel.showInterns({ (Interns) in
            
            self.interns = Interns
            completion(interns: self.interns)
            
        
            }, onFailure: { (error) in
                print ("Something went wrong with the Interns")
            }
        )
    }
    
}