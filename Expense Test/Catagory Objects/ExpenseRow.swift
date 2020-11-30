/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A single row to be displayed in a list of expenses.
 */

import SwiftUI

struct ExpenseRow: View {
    var expense: Expense
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text(expense.description)
                    .multilineTextAlignment(.leading)
                Text("\(expense.date, formatter: dateFormatter)")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                Text(String(expense.category)
                )
                .font(.footnote)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                
                
                
            }
            Spacer()
            Text("$\(expense.amount, specifier: "%.2f")")
                .foregroundColor((expense.category != "Income") ? Color.red: Color.green)
            
            
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
