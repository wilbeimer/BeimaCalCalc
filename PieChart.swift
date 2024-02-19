//
//  DrawCricle.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 2/16/24.
//

import SwiftUI

struct PieChart: View {
    @State var x: Int
    @State var y: Int
    
    @State var radius: CGFloat
    @Binding var angle: CGFloat
    
    var body: some View {
        ZStack{
            Path { path in
                path.move(to: CGPoint(x: x, y: y))
                path.addArc(center: .init(x: x, y: y), radius: radius, startAngle: Angle(degrees: 369), endAngle: Angle(degrees: 0), clockwise: true)
            }
            .fill(.blue)
            
            Path { path in
                path.move(to: CGPoint(x: x, y: y))
                path.addArc(center: .init(x: x, y: y), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: angle), clockwise: true)
            }
            .fill(Color(.systemGray5))
        }
    }
}
