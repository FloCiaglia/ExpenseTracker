//
//  Category.swift
//  Expense Test
//
//  Created by Bethany Hull on 11/4/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

class Category: Identifiable, Codable, Equatable {
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        if (lhs.category == rhs.category) {
            return true
        }
        return false
    }
    
    
    var category: String
    
    init(category c: String) {
        self.category = c
    }
}


class Categories: ObservableObject {
    
    @Published var categories: [Category]
   
    init(){
        self.categories = load("categoryData.json")
    }
    
    
    func addCategory(category cat: String) {
        self.categories.append(Category(category: cat))
        writeToFile(file: "categoryData.json")
        }
    
    func getStringArray() -> [String] {
        var arr: [String] = []
        for cat in categories {
            arr.append(cat.category)
        }
        return arr
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
            let JsonData = try encoder.encode(self.categories)
            try JsonData.write(to: location)
        }catch
        {
            fatalError("Couldn't write to file:\n\(error)")
        }
    }
    
}

