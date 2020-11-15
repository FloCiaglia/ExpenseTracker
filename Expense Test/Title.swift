//
//  Title.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct Title: View
{
    var body: some View
    {
        VStack(alignment: .center)
        {
            Image("appLogo").resizable().frame(width: 100.0, height: 100.0)
            Text("Expense Tracker").font(.largeTitle).fontWeight(.heavy).foregroundColor(.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [.blue, Color("custGreen")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
    }
}

struct Title_Previews: PreviewProvider
{
    static var previews: some View
    {
        Title()
    }
}
