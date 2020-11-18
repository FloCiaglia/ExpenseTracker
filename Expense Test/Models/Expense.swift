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
    
    var id: String
    //var name: String
    var description: String
    //var date: Date
    var amount: Double
    var date: Date
    var category: String
    


    enum Category: String, CaseIterable, Codable, Hashable {
        case groceries = "Groceries"
        case rent = "Rent"
        case utilities = "Utilities"
        case income = "Income"
        case savings = "Savings"
        
        
    }
    init(id exp_id: String, description desc: String, amount ex_am: Double, date d: Date, category cat: String) {
        self.id = exp_id
        self.description = desc
        self.amount = ex_am
        self.category = cat
        self.date = d
        
    }
    
    func changeDesc(Description des: String) {
        self.description = des
    }
}


// This is the class that creates a list of expenses. This may also be a good place to
// put the code to read and write from the josn file. That way when the list is created all the expenses are read in
// and then the app closes or a save button is pushed we can call a function from this class to write the allExpenses list
// to the json file. Just a random idea. :P
// Next check out line 18 in NavigationTabs to see how the environment object works.


class Expenses: ObservableObject {
    @Published var allExpenses: [Expense]
    @Published var categories: [String]

    init() {
        self.allExpenses = load("expenseData.json")
        self.categories = ["Groceries", "Rent", "Utilities", "Income", "Savings"]
        
        
//        This is a test initialization of the list for testing.. eventually the data would be read on init()
        
    }
    
    func addExpense(description desc: String, amount ex_am: Double, income inc: Bool, date d: Date, category cat: String) {
        var newExpense = Expense(id: UUID().uuidString, description: desc, amount: ex_am, date: d, category: cat)
        self.allExpenses.append(newExpense)
        
        // TODO: add write function here
        
    }
    
    
    
    // This method writes to the json file
    func writeToFile(location: URL)
    {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(self.allExpenses)
            try JsonData.write(to: location)
        }catch
        {
                fatalError("Could'nt write to file:\n\(error)")
        }
    }
    
    //func setupSaveButton()
    //{
        // we need a save button. When this button is clicked - it calls tappedSaveBtn()
    //}
    
    //@objc func tappedSaveBtn() // this method does the storing
    //{
        // Need the name of the "textbox"
    //}
    
    func deleteExpense(at exp: Expense) {
        var found = false
        var i = 0
        
        while(found == false && i < self.allExpenses.count) {
            if (exp.id == self.allExpenses[i].id) {
                self.allExpenses.remove(at: i)
                found = true
            }
            i+=1
        }
        
            // TODO: add write function here
    

}
}





struct Expense_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

