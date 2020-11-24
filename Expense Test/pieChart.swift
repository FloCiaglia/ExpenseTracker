//
//  pieChart.swift
//  Expense Test
//
//  Created by Daniel Rao on 11/20/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI


extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1)
        )
    }
}

struct AssetAllocation {
    let key : String
    let percentage : Double
    let color: Color
}

final class PieChartViewModel: ObservableObject {

    @ObservedObject var expenses = Expenses()
    var data: [AssetAllocation] {

        let dictForPie: Dictionary<String, Double> = expenses.completeDictionaryBuilder()
        //print(dictForPie)
        var arr: [AssetAllocation] = []

        for exp in dictForPie {
            
            let asset: AssetAllocation = AssetAllocation(key: exp.key, percentage: exp.value, color: Color.random)
            arr.append(asset)
        }
        return arr
    }
    
}
    


struct PieceOfPie: Shape{

    let startDegree: Double
    let endDegree: Double

    func path(in rect: CGRect) -> Path {

        Path { p in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            p.move(to: center)
            p.addArc(center: center, radius: rect.width/3, startAngle: Angle(degrees: startDegree), endAngle: Angle(degrees: endDegree), clockwise: false)
            p.closeSubpath()

        }
    }
}

struct pieChart: View {
    @ObservedObject var viewModel = PieChartViewModel()

    var body: some View {

        ZStack{

            ForEach(0..<viewModel.data.count){ index in

                let currentData = viewModel.data[index]
                let currentDegree = currentData.percentage * 360
                let lastDegree = viewModel.data.prefix(index).map{
                    $0.percentage

                }.reduce(0, +) * 360

                ZStack {
                    PieceOfPie(startDegree: lastDegree, endDegree: lastDegree + currentDegree).fill(currentData.color)
                }
            }


        }

    }

}

