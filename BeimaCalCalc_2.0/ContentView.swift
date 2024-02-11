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
    
    @State var fuckAlex: Bool = false
    
    @State var usedCals: Float = 0
    
    @State var foodsEaten: [Food] = []

    var body: some View {
        NavigationStack{
            VStack{
                HStack(spacing: 90.0){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("<")
                    })
                    
                    Text("Today").font(.title2).foregroundColor(colorScheme == .dark ? .blue : .blue).onTapGesture(perform: { fuckAlex.toggle()})
                    
                    Button(action:{}, label: {
                        Text (">")
                    })
                }
                
                
                if fuckAlex{
                    Text("Fuck you Alex!")
                }
                
                VStack{
                    Text("Calories:")
                    HStack{
                        let (bar1Length, bar2Length) = getBarLengths(usedCals: Float(usedCals))
                        
                        Rectangle()
                            .fill(.blue)
                            .frame(width: CGFloat(bar1Length), height: 20)
                        
                        Rectangle()
                            .fill(.quaternary)
                            .frame(width: CGFloat(bar2Length), height: 20)
                    }
                    Text("\(Int(usedCals)) / \(Int(totalCals))")
                }
                
                
                
                NavigationLink{
                    FoodSearch(foodsEaten: $foodsEaten, usedCals: $usedCals)
                            .navigationBarTitle("")
                } label: {
                        Text("Search for a food.")
                }
                .navigationBarTitle("")
                .padding(.vertical, 0.5)
                
                
                List {
                    ForEach(foodsEaten) { food in
                        Text(food.name + "\n" + "Cal. " + String(Int(food.calories)))}
                }
            }
            Spacer()
        }
    }
}

func addNew(foodsEaten: inout [Food], usedCals: inout Float, food: Food){
    
    if food.name != ""{
        foodsEaten.append(food)
        
        usedCals += food.calories
    }
}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
            .environmentObject(Foods())
    }
}
