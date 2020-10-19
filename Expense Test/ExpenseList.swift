/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of expenses.
*/

import SwiftUI

struct ExpenseList: View {
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

struct ExpenseList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            ExpenseList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
