/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI

struct Expense: Hashable, Codable {
    var id: Int
    //var name: String
    var description: String
    //var date: Date
    var amount: Double
    var income: Bool
    var category: Category


    enum Category: String, CaseIterable, Codable, Hashable {
        case groceries = "Groceries"
        case rent = "Rent"
        case utilities = "Utilities"
        case income = "Income"
    }
}




