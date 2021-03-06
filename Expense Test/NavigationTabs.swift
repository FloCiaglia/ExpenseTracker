//
//  NavigationTabs.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct NavigationTabs: View {
    @State private var showTitle = true
    
    
//  This is the expenses object all the UI views will be reading from and making changes to.
//    On line 53 the object is being made available to all this views "children". Check out
//    CatagoryView line 15 to see how it is used.
    
    var expenses = Expenses()
    //name n: String, income money: Double, age year: Int, profession job: Double, gender sex: String)
    //, age: 32, profession: "Engineer", gender: "Female"
    var usrs = Users()
    var categories = Categories()
    
    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                CategoryView()
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Category")
                    }
                
                AddExpenseView()
                    .tabItem {
                        Image(systemName: "plus.circle")
                        Text("Add Expense")
                    }
                
                ChartView()
                    .tabItem {
                        Image(systemName: "chart.bar.xaxis")
                        Text("Charts")
                    }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
            }
            .environmentObject(expenses)
            .environmentObject(usrs)
            .environmentObject(categories)
            if showTitle {
                Title()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {self.showTitle.toggle()}
                        
                        
            }
                
            
        }
            
    }

    }

struct NavigationTabs_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTabs()
    }
}
}
