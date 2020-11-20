//
//  AddExpenseView.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct AddExpenseView: View {
    init(){
        UITableView.appearance().backgroundColor = .clear // Clears the light gray background color in the form below
    }
    

    
    @State private var categorySelectionIndex = 0
    private var categories: Array<String> {
        return (Expense.Category.allCases.map { $0.rawValue })
    }
    // variables connected to the text field boxes
    @State private var descr = ""
    @State private var amount = ""
    @State private var income = false
    @State private var date = Date()
    
    private var category: Expense.Category {
        let cat: Expense.Category? = Expense.Category(rawValue: categories[categorySelectionIndex])
        return cat!
    }
    
    @EnvironmentObject var expenses: Expenses // the expense list object
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                
                Form
                {
                    Section(header: Text("Expense Type").bold().foregroundColor(Color("custGreen")))
                    {
                        Picker(selection: $categorySelectionIndex, label: Text("Selected Catagory"))
                        {
                            ForEach(0 ..< categories.count)
                            {
                                Text(self.categories[$0])
                            }
                        }
                    }
                    
                    Section(header: Text("Expense Description").bold().foregroundColor(Color("custGreen")))
                    {
                        TextField("Enter Description", text: $descr).textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Section(header: Text("Expense Amount").bold().foregroundColor(Color("custGreen")))
                    {
                        TextField("Enter Amount", text: $amount).textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    
                    Section(header: Text("Amount Entered is Income").bold().foregroundColor(Color("custGreen")))
                    {
                        Toggle(isOn: $income)
                        {
                            Text("Enabled")
                            
                        }
                    }
                    DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                                    Text("Select a date")
                                }
                    
                    Button(action:
                            {
                                expenses.addExpense(description: descr, amount: (amount as NSString).doubleValue, income: income, date: date, category: category)
                                descr = ""
                                amount = ""
                                income = false
                                print(date)
    //                            expenses.writeToFile(location: "expenseData.json")
                                
                            })
                    {
                        Text("Add Expense").font(.title).fontWeight(.heavy).foregroundColor(.white).bold()
                    }
                    .frame(width: 320, height: 60).background(Color("custGreen"))
                }.navigationBarTitle("Enter Expense!")
                
                
                
            }
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddExpenseView()
            AddExpenseView()
        }
    }
}
