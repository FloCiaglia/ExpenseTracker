//
//  CategoryView.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    @State private var categorySelectionIndex = 0
    
    //    This gives this view access to the object declared in the NavigationTabs view.
    @EnvironmentObject var expenses: Expenses
    
    //    computed property for dynamic list of categories
    var categories: Array<String> {
        var cat = (Expense.Category.allCases.map { $0.rawValue })
        cat.insert("All", at: 0)
        return cat
    }
    
    
    
    // computed property filter expenses based on catagory selected
    private var filteredExpenses: [Expense] {
        if (categories[categorySelectionIndex] == "All") {
            return expenses.allExpenses
        }
        else {
            return expenses.allExpenses.filter { $0.category == categories[categorySelectionIndex] }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Picker(selection: $categorySelectionIndex, label: Text("Selected Category").bold()) {
                            ForEach(0 ..< categories.count) {
                                Text(self.categories[$0])
                            }
                        }
                    }.listRowBackground(Color.white)
                    List {
                        ForEach(filteredExpenses, id: \.id) {
                            expense in
                            NavigationLink(destination: ExpenseDetail(expense: expense)) {
                                ExpenseRow(expense: expense)
                            }.font(.callout)
                        }.onDelete(perform: { expense in
                            let exp = filteredExpenses[expense.first!]
                            expenses.deleteExpense(at: exp)
                        })
                        
                    }.listRowBackground(Color.white)
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(LinearGradient(gradient: Gradient(colors: [.blue, Color("custGreen")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
            }.navigationBarTitle("Expense Category!")
        }
    }
}




struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            CategoryView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
