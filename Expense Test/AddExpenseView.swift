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
    @State private var showingCategoryEdit: Bool = false
    
    // variables connected to the text field boxes
    @State private var descr = ""
    @State private var amount = ""
    @State private var date = Date()
    
    
    
    @EnvironmentObject var expenses: Expenses // the expense list object
    @EnvironmentObject var users: Users
    @EnvironmentObject var categories: Categories
    @State private var pickerID = 0
    
    private var category: String {
        return categories.categories[categorySelectionIndex].category
        
    }
    
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
                            
                            ForEach(0 ..< categories.categories.count) {
                                let cat: String = categories.categories[$0].category
                                if categories.categories[$0] == categories.categories.last {
                                    
                                    Text(cat)
                                        .navigationBarTitle("Select")
                                        .navigationBarItems(trailing: button()
                                        )
                                        .tag(UUID())
                                } else {
                                    Text(cat)
                                        .tag(UUID())
                                }
                            }.id(pickerID)
                        }
                        .navigationBarItems(trailing: Text(""))
                        
                    }
                    
                    Section(header: Text("Expense Description").bold().foregroundColor(Color("custGreen")))
                    {
                        TextField("Enter Description", text: $descr).textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    if( users.getImage() != nil) {
                        Image(uiImage: users.getImage()!)
                    }
                    
                    
                    Section(header: Text("Expense Amount").bold().foregroundColor(Color("custGreen")))
                    {
                        TextField("Enter Amount", text: $amount).textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    
                    Section(header: Text("Date of Expense ").bold().foregroundColor(Color("custGreen")))
                    {
                        DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                            Text("Select a date")
                        }
                    }
                    
                    Button(action:
                            {
                                expenses.addExpense(description: descr, amount: (amount as NSString).doubleValue, date: date, category: category)
                                descr = ""
                                amount = ""
                                print(date)
                                //
                                
                            })
                    {
                        Text("Add Expense").font(.title).fontWeight(.heavy).foregroundColor(.white).bold()
                    }
                    .frame(width: 320, height: 60).background(Color("custGreen"))
                }
                .navigationBarTitle("Enter Expense!")
                
                
            }
        }
    }
    func button() -> some View {
        HStack(alignment: .center, content: {
            Button(action: {
                self.showingCategoryEdit.toggle()
            }) {
                Image(systemName: "plus")
            }.sheet(isPresented: $showingCategoryEdit) {
                AddCategory(isPresented: self.$showingCategoryEdit).onDisappear(perform: {
                    pickerID += 1
                })
            }
        })
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
