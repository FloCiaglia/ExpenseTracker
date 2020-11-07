/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI


// This is the expense class. For each expense an expense object is created. See an example
// of how in the init function on line 34 and an example of creating an expense on line 59
// Next check out the Expenses class on line 52.

class Expense: Identifiable, Codable {
    
    var id: Int
    //var name: String
    var description: String
    //var date: Date
    var amount: Double
    var income: Bool
    var category: Category


    enum Category: String, CaseIterable, Codable, Hashable {
        case groceries = "Groceries"
        case rent = "Rent"
        case utilities = "Utilities"
        case income = "Income"
        
        
    }
    init(id exp_id: Int, description desc: String, amount ex_am: Double, income inc: Bool, category cat: Category) {
        self.id = exp_id
        self.description = desc
        self.amount = ex_am
        self.income = inc
        self.category = cat
        
    }
}


// This is the class that creates a list of expenses. This may also be a good place to
// put the code to read and write from the josn file. That way when the list is created all the expenses are read in
// and then the app closes or a save button is pushed we can call a function from this class to write the allExpenses list
// to the json file. Just a random idea. :P
// Next check out line 18 in NavigationTabs to see how the environment object works.


class Expenses: ObservableObject {
    @Published var allExpenses: [Expense]

    init() {
        self.allExpenses = []
        
//        This is a test initialization of the list for testing.. eventually the data would be read on init()
        self.allExpenses.append(Expense(id: 27, description: "Winco", amount: 20.22, income: false, category: Expense.Category.groceries))
        self.allExpenses.append(Expense(id: 20, description: "Homegroup", amount: 87.54, income: false, category: Expense.Category.rent))
    }
}




