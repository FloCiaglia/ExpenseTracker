//
//  pieChart.swift
//  Expense Test
//
//  Created by Daniel Rao on 11/20/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI


struct AssetAllocation {
    let key : String
    let degree : Double
    let color: UIColor
}

final class PieChartViewModel: ObservableObject {
    
    @EnvironmentObject var expenses: Expenses
    var data: [AssetAllocation] {
        
        let dictForPie: Dictionary<String, Double> = expenses.completeDictionaryBuilder()
        var arr: [AssetAllocation] = []
        
        for exp in dictForPie {
            
            arr.append(AssetAllocation(key: exp.key, degree: exp.value, color: getRandomColor()))
        }
        return arr
        
    }
    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
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
                let currentDegree = currentData.degree
                let lastDegree = viewModel.data.prefix(index).map{
                    $0.degree
                    
                }.reduce(0, +)
                
                ZStack {
                    PieceOfPie(startDegree: currentDegree, endDegree: lastDegree + currentDegree)
                }
            }
            
            
        }
        
    }
    
}



