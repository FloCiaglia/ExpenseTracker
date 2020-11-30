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
    @EnvironmentObject var users: Users
    //@Binding var username: String
    
    
    
    var body: some View {
        
        NavigationView
        {
            VStack
            {
                
                HStack
                {
                    Text(verbatim: "Welcome " + String(users.getUsername()) + "!").font(.largeTitle).position(x: 120, y: 120)
                    Spacer().frame(width: 50)
                    
                    if( users.getImage() != nil) {
                        Image(uiImage: users.getImage()!)
                            .resizable()
                            .frame(width: 110, height: 110)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .scaledToFit()
                            .position(x: 90, y: 140)
                    }else{
                        Image("appLogo")
                            .resizable()
                            .frame(width: 110, height: 110)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .scaledToFit()
                            .position(x: 90, y: 140)
                    }
                }

                //  current balance
                Text("This is your current balance: ").font(.title2).position(x: 210, y:150)
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.black)
                        .frame(width: 270, height: 80)
                        .position(x: 210, y: 110)
                        .opacity(0.4)
                    
                    Text("$\(expenses.getBalance(), specifier: "%.2f")")
                        .bold().font(.largeTitle).position(x: 210, y:110).foregroundColor(.white).opacity(0.7)
                }
                Spacer().frame(height: 40)
                
                //categories
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.black)
                        .frame(width: 270, height: 80)
                        .position(x: 210, y: 110)
                        .opacity(0.4)
                    
                    
                    HStack{
                        Text("You have a total of " +  String(categories.categories.count) + " categories!").bold().font(.subheadline).multilineTextAlignment(.leading).frame(width: 120.0)
                            .position(x: 170, y:110)
                            .foregroundColor(.white).opacity(0.7)
                         Spacer().frame(width: 50)
                         Image("icons8-money_bag").resizable().frame(width: 60.0, height: 60.0)
                         .position(x: 70.0, y: 110)
                     
                    }
                }
                
                //income and expense
                Spacer().frame(height: 75)
                HStack
                {
                    Text("Income").bold().font(.title2).position(x: 130.0, y: 50)
                    Spacer().frame(width: 50)
                    Text("Expense").bold().font(.title2).position(x: 50.0, y: 50)
                }
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 3, height: 100)
                    .position(x: 205, y: -30)
                //Spacer().frame(height: 15)
                
                HStack
                {
                    Text("$" + String(expenses.gettotalIncome())).font(.title2).position(x: 130.0, y: -130)
                    Spacer().frame(width: 70)
                    Text("$" + String(expenses.gettotalExpense())).font(.title2).position(x: 40.0, y: -130)
                }

            }.font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [.blue, Color("custGreen")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
            //.navigationTitle("Welcome!")
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
