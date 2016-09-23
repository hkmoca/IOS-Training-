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
    let nsModel = EmployeesManager()
    
    static func getIDToken() -> String {
       let persons = realm.objects(User.self)
        let user = persons[0] as User
        return user.idToken
    }
    
    func displayPeople(completion: (people: [User]) -> Void){
        
       
         nsModel.showEmployees({ (Employees) in
            
            self.people = Employees
            self.displayInterns({ (interns) in
            self.people.appendContentsOf(interns)
            self.people = self.people.sort { $0.fullName < $1.fullName }
                completion(people: self.people)
            })
            
            }, onFailure: { (error) in
                print ("Something went wrong with the Employees")
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