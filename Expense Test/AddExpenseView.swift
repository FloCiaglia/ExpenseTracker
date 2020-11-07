//
//  AddExpenseView.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct AddExpenseView: View {
    // variables connected to the text field boxes
    @State private var descr = ""
    @State private var amount = "0.00"
    @State private var income = false
    
    @EnvironmentObject var expenses: Expenses // the expense list object

    var body: some View {
        VStack {
            TextField("Enter description", text: $descr)
            TextField("Enter amount", text: $amount)
                .keyboardType(.decimalPad)
            
            Toggle(isOn: $income) {
                Text("Is this income?")
            }
            Button(action: {
                expenses.addExpense(description: descr, amount: (amount as NSString).doubleValue, income: income, category: .groceries)
                
            }
            
            ) {
                Text("Add Expense")
            }
        }
        
        
        
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
