//
//  Title.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Expense Tracker")
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            .fontWeight(.heavy)
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor(hue: 226.7, saturation: 0.278, brightness: 0.19, alpha: 1)))
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
