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
        PieceOfPie(startDegree: 0, endDegree: 90).fill(Color.blue)


    }
}


struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct PieceOfPie: Shape{
    let startDegree: Double
    let endDegree: Double
    
    func path(in rect: CGRect) -> Path {
      
        Path { p in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            p.move(to: center)
            p.addArc(center: center, radius: rect.width/2, startAngle: Angle(degrees: startDegree), endAngle: Angle(degrees: endDegree), clockwise: false)
            
        }
    }

}
