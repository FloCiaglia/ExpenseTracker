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

    
    init() {
        self.allExpenses = load("expenseData.json")

        
        
        //        This is a test initialization of the list for testing.. eventually the data would be read on init()
        
    }
    
    func addExpense(description desc: String, amount ex_am: Double, date d: Date, category cat: String) {
        let newExpense = Expense(id: UUID().uuidString, description: desc, amount: ex_am, date: d, category: cat)
        self.allExpenses.insert(newExpense, at: 0)
        print(d.timeIntervalSinceReferenceDate)
        
        writeToFile(file: "expenseData.json")
        
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
            let JsonData = try encoder.encode(self.allExpenses)
            try JsonData.write(to: location)
        }catch
        {
            fatalError("Couldn't write to file:\n\(error)")
        }
        }
    
    //<<<<<<< HEAD
    //=======
    //    //func setupSaveButton()
    //    //{
    //    // we need a save button. When this button is clicked - it calls tappedSaveBtn()
    //    //}
    //
    //    //@objc func tappedSaveBtn() // this method does the storing
    //    //{
    //    // Need the name of the "textbox"
    //    //}
    //
    //>>>>>>> master
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
        writeToFile(file: "expenseData.json")
        
    }
    
    func gettotalIncome() -> String {
        var inc: Double = 0
        
        for expen in allExpenses {
            if(expen.category == "Income"){
                inc = inc + expen.amount
            }
        }
        return numbFormat(num: inc)
    }
    
    
    
    func gettotalExpense() -> String {
        var exp: Double = 0
        
        for expen in allExpenses {
            if(expen.category != "Income"){
                exp = exp + expen.amount
            }
        }
        return numbFormat(num: exp)
    }
    
    
    func numbFormat(num: Double) -> String {
        
        let formattedNum = String(format: "%.2f", num)
        
        return formattedNum
    }
    
    
    func getBalance() -> Double{
        var balance: Double = 0
        let income = gettotalIncome()
        let expenses = gettotalExpense()
        balance = (Double(income) ?? 0) - (Double(expenses) ?? 0)
        
        return balance
    }
    
    
    func getGrandTotal() -> CGFloat {
        var total: CGFloat = 0
        for expen in allExpenses {
            total = total + CGFloat(expen.amount)
        }
        return total
    }
    
    //This method organizes expenses and their values
    func compileExpenseAmt() -> Dictionary<String, Array<Double>>{
        
        var categAmmDict = Dictionary<String, Array<Double>>()
        
        for expen in allExpenses {
            
            //check if the key value is null
            if (categAmmDict[expen.category] == nil){
                let ammt: Double = expen.amount
                var arr: [Double] = []  //values stored for each key in an array
                arr.append(ammt)
                categAmmDict[expen.category] = arr
                
            }
            else {
                let ammt: Double = expen.amount
                categAmmDict[expen.category]?.append(ammt)
                
            }
            
        }
        return categAmmDict
        
    }
    
    //This method organizes expenses and their sum of values
    func SummedcompileExpenseAmt(precategAmmDict: Dictionary<String, Array<Double>>) -> Dictionary<String, Double> {
        
        let categAmmDict = precategAmmDict
        var postcategAmmDict: Dictionary<String, Double> = [:]
        
        for expen in allExpenses {
            var ammt: Double = 0;
            let arr: Array<Double> = categAmmDict[expen.category]!
            for sum in arr {
                ammt = ammt + sum
            }
            
            postcategAmmDict[expen.category] = ammt;
            
        }
        
        return postcategAmmDict
    }
    
    //This method calculates percentage of each category and stores that into the dictionary.
    func percentageCalculator(dict: Dictionary<String, Double>) -> Dictionary<String, Double>
    {
        let preDict = dict
        var postcategAmmDict: Dictionary<String, Double> = [:]
        let totalexpen: Double =  Double(getGrandTotal())
        
        for expen in allExpenses {
            var temp: Double  = 0
            temp = ((preDict[expen.category]!)/totalexpen)
            postcategAmmDict[expen.category] = temp
            
        }
        return postcategAmmDict
        
    }
    
    
    
    //This method helps with calculating degrees for slice.
    func pieDegreeCalculator(preDegDict: Dictionary<String, Double>) -> Dictionary<String, Double>
    {
        let preDict = preDegDict
        var postDegDict: Dictionary<String, Double> = [:]
        
        for expen in allExpenses {
            postDegDict[expen.category] =  (preDict[expen.category]!/100) * 360
        }
        return postDegDict
    }
    
    //This function builds everything from scratch to get from values to degrees. (Its like a combo pack)
    func completeDictionaryBuilder() -> Dictionary<String, Double>{
        return percentageCalculator( dict: SummedcompileExpenseAmt(precategAmmDict: compileExpenseAmt()))
    }
    
}


struct Expense_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


