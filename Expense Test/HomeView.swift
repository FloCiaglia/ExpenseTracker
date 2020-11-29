//
//  HomeView.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var expenses: Expenses
    @EnvironmentObject var categories: Categories
    
    
    
    var body: some View {
                ZStack {
                    commonStyle()
                    Text("Welcome Friend!").font(.largeTitle).position(x: 150.0, y: 100.0)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [.blue, Color("custGreen")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
        
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(Color.black)
                        .frame(width: 340, height: 160).position(x:200, y: 260).opacity(0.4)
        
                    Text("We are 24 hours open to the service.").font(.subheadline).position(x: 155.0, y: 120)
        
                    Text("You have a total of " +  String(categories.categories.count) + " categories!").bold().font(.subheadline).multilineTextAlignment(.leading).frame(width: 120.0).position(x: 130, y: 250).foregroundColor(.white).opacity(0.7)
        
                    Image("icons8-money_bag").resizable().frame(width: 100.0, height: 100.0).position(x: 290.0, y: 250)
        
        
                    Text("Income").font(.headline).position(x: 100.0, y: 400)
        
        
                    Text("Expense").font(.headline).position(x: 260.0, y: 400)
        
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 2, height: 100).position(x:190, y: 450)
        
        //            Text("$" + String(expenses.gettotalIncome()))
        //            Spacer()
        //            Text("$" + String(expenses.gettotalIncome()))
        
                    Text("$" + expenses.gettotalIncome() + "           $" +  expenses.gettotalExpense()).position(x:190, y: 450).font(.title)
                }
        
//        NavigationView
//        {
//            VStack
//            {
//
//                Text("We are 24 hours open to the service.").font(.subheadline)
//                Spacer().frame(height: 300)
//
//                Text("We are 24 hours open to the service.").frame(width: 280, height: 120).background(Color.black).opacity(0.30).font(.subheadline).offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: -10.0/*@END_MENU_TOKEN@*/)
//
//                HStack
//                {
//                    Text("Income")
//                    Spacer().frame(width: 50)
//                    Text("Expense")
//                }
//                Spacer().frame(height: 20)
//                HStack
//                {
////                    Text("$" + String(expenses.gettotalIncome()))
////                    Spacer().frame(width: 70)
////                    Text("$" + String(expenses.gettotalExpense()))
//                }
//
//            }.font(.largeTitle)
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(LinearGradient(gradient: Gradient(colors: [.blue, Color("custGreen")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all).navigationTitle("Welcome Friend!")
//        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
