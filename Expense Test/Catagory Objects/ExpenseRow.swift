/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of expenses.
*/

import SwiftUI

struct ExpenseRow: View {
    var expense: Expense

    var body: some View {
        HStack {
            
           
            
            VStack {
                Text(expense.description)
                Text(String(expense.category.rawValue)
                        )
                    .font(.footnote)
                .foregroundColor(Color.gray)
                
                    
                
            }
            Spacer()
            Text("$" + String(expense.amount))
                .foregroundColor(!expense.income ? Color.red: Color.green)
            
            
        }
    }
}

struct ExpenseRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExpenseRow(expense: expenseData[0])
            ExpenseRow(expense: expenseData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
