//
//  CategoryView.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        NavigationView {
            List(expenseData, id: \.id) { expense in
                NavigationLink(destination: ExpenseDetail(expense: expense)) {
                    ExpenseRow(expense: expense)
                }
            }
            .navigationBarTitle(Text("Expenses"))
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
