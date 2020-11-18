/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a expense.
*/

import SwiftUI

struct ExpenseDetail: View {
    var expense: Expense

    var body: some View {
        VStack {

            VStack(alignment: .leading) {
                Text(expense.description)
                    .font(.title)

                HStack(alignment: .top) {
                    Text(expense.category)
                        .font(.subheadline)
                    Spacer()
                    Text(String(expense.amount))
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(expense.description), displayMode: .inline)
    }
}

struct ExpenseDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDetail(expense: expenseData[0])
    }
}

