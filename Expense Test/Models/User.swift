//
//  User.swift
//  Expense Test
//
//  Created by Bethany Hull on 11/4/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

class User: Identifiable, Codable {
    
    let name: String
    let income: String
    var categories: [String]
//    let age: Int
//    let profession: String
//    let gender: String
    
    //Taken out for now: , age year: Int, profession job: String, gender sex: String
    init(name n: String, income money: String, categories cat: [String]) {
        self.name = n
        self.income = money
        self.categories = cat
//        self.age = year
//        self.profession = job
//        self.gender = sex
    }
}


class Users: ObservableObject {
    
    @Published var users: User
   
    init(){
        self.users = load("userData.json")
    }
    
    //, age year: Int, profession job: String, gender sex: String
    func addUser(name n: String, income money: String) {
        //, age: year, profession: job, gender: sex
        let basicCat = ["Income", "Savings"]
        let newUser = User(name: n, income: money, categories: basicCat)
        users = newUser
        writeToFile(file: "userData.json")
        
        //debug statement
        print("new users added")
        
    }
    
    func addCategory(category cat: String) {
        self.users.categories.append(cat)
        writeToFile(file: "userData.json")
        }
    
    
    // This method writes to the json file
    func writeToFile(file: String)
    {
        guard let location = Bundle.main.url(forResource: file, withExtension: nil)
            else {
                fatalError("Couldn't find \(file) in main bundle.")
        }
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(self.users)
            try JsonData.write(to: location)
        }catch
        {
            fatalError("Couldn't write to file:\n\(error)")
        }
    }
    
}
