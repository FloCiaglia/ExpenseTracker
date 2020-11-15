//
//  HomeView.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            commonStyle()
            Text("Welcome Friend!").font(.largeTitle).position(x: 135.0, y: 50.0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [.blue, Color("custGreen")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.black)
                .frame(width: 280, height: 120).position(x:160, y: 145).opacity(0.4)
            
            Text("We are 24 hours open to the service.").font(.subheadline).position(x: 155.0, y: 60)
            
            Text("We are 24 hours open to the service.").font(.subheadline).multilineTextAlignment(.leading).frame(width: 100.0).position(x: 100, y: 140)
            
        }
        
       
     
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
