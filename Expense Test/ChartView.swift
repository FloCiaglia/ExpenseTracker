//
//  ChartView.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct ChartView: View {
    @EnvironmentObject var expenses: Expenses
    var body: some View {
        
        NavigationView
        {
            ZStack{
                pieChart().frame(maxWidth: 330, maxHeight: 330)
                Spacer().frame(height: 90)
              //  ZStack{
                //Text("Hello")
              //  }
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(LinearGradient(gradient: Gradient(colors: [.blue, Color("custGreen")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all).navigationTitle("Pie Chart")
            
        }
        
    }
    
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}


