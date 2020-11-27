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
    

    
    var body: some View {
        ZStack {
            commonStyle()
            Text("Welcome Friend!").font(.largeTitle).position(x: 135.0, y: 50.0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [.blue, Color("custGreen")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.black)
                .frame(width: 280, height: 120).position(x:160, y: 145).opacity(0.4)
            
            Text("We are 24 hours open to the service.").font(.subheadline).position(x: 155.0, y: 60)
            
            Text("You have a total of -- categories").font(.subheadline).multilineTextAlignment(.leading).frame(width: 108.0).position(x: 100, y: 140).foregroundColor(.white).opacity(0.7)
            
            Image("icons8-money_bag").resizable().frame(width: 100.0, height: 100.0).position(x: 220.0, y: 140)
            
            
            Text("Income").font(.headline).position(x: 85.0, y: 250)
            
            
            Text("Expense").font(.headline).position(x: 230.0, y: 250)
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 2, height: 100).position(x:160, y: 290)
            
//            Text("$" + String(expenses.gettotalIncome()))
//            Spacer()
//            Text("$" + String(expenses.gettotalIncome()))
            
            Text("$" + expenses.gettotalIncome() + "           $" +  expenses.gettotalExpense()).position(x:160, y: 290).font(.title)
        }
        
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
