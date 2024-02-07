//
//  ContentView.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 12/28/23.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var foods: Foods
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var fuckAlex: Bool = false
    
    @State private var usedCals = 0
    
    @State private var foodsEaten: [Food] = []

    var body: some View {
        NavigationStack{
            VStack{
                HStack(spacing: 90.0){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Wilson Beima")
                    })
                    
                    Text("Today").font(.title2).foregroundColor(colorScheme == .dark ? .blue : .blue).onTapGesture(perform: { fuckAlex.toggle()})
                    
                    Button(action:{}, label: {
                        Text ("V 0.1")
                    })
                }
                
                if fuckAlex{
                    Text("Fuck you Alex!")
                }
                
                VStack{
                    HStack{
                        let (bar1Length, bar2Length) = getBarLengths(usedCals: Float(usedCals))
                        
                        Rectangle()
                            .fill(.blue)
                            .frame(width: CGFloat(bar1Length), height: 20).padding(0)
                        
                        Rectangle()
                            .fill(.quaternary)
                            .frame(width: CGFloat(bar2Length), height: 20).padding(0)
                    }
                    Text("\(Int(usedCals)) / \(Int(totalCals))")
                }
            }
                NavigationLink{
                    FoodSearch()
                        .navigationBarTitle("")
                } label: {
                    Text("Search for a food.")
                }
                .navigationBarTitle("")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
            .environmentObject(Foods())
    }
}
