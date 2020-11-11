//
//  AddExpenseView.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct AddExpenseView: View {
    @State private var categorySelectionIndex = 0
    private var categories: Array<String> {
        return (Expense.Category.allCases.map { $0.rawValue })
    }
    // variables connected to the text field boxes
    @State private var descr = ""
    @State private var amount = ""
    @State private var income = false
    
    private var category: Expense.Category {
        let cat: Expense.Category? = Expense.Category(rawValue: categories[categorySelectionIndex])
        return cat!
    }
    
    @EnvironmentObject var expenses: Expenses // the expense list object

    var body: some View {
        NavigationView {
        VStack {
            Form {
                
                    
                    Picker(selection: $categorySelectionIndex, label: Text("Selected Catagory")) {
                        ForEach(0 ..< categories.count) {
                            Text(self.categories[$0])
                        }
                    }
                    
                
                TextField("Enter description", text: $descr)
                TextField("Enter amount", text: $amount)
                    .keyboardType(.decimalPad)
 
                Toggle(isOn: $income) {
                    Text("Is this income?")
                        
                }
            }

            
            Button(action: {
                expenses.addExpense(description: descr, amount: (amount as NSString).doubleValue, income: income, category: category)
                descr = ""
                amount = ""
                income = false
                
                
            }
            
            ) {
                Text("Add Expense")
            }
            .frame(width: 100, height: 50)
        }}
        
        
        
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
