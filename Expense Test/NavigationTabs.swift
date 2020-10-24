//
//  NavigationTabs.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct NavigationTabs: View {
    var body: some View {
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
    }
}

struct NavigationTabs_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTabs()
    }
}
