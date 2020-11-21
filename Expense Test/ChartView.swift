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
            ZStack{
                pieChart()
            }.environmentObject(expenses)
           
        }
        
    }
    
    struct ChartView_Previews: PreviewProvider {
        static var previews: some View {
            ChartView()
        }
    }


