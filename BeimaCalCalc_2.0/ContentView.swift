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
    
    @State var totalCals = "2000"
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(spacing: 90.0){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Wilson Beima")
                    })
                    
                    Text("Today").font(.title2).foregroundColor(colorScheme == .dark ? .blue : .blue).onTapGesture(perform: { fuckAlex.toggle()})
                    
                    NavigationLink{
                        Settings(totalCals: $totalCals)
                        } label: {
                            Text ("⚙")
                        }
                }
                
                if fuckAlex{
                    Text("Fuck you Alex!")
                }
                
                VStack{
                    Text("Calories:")
                    HStack{
                        let (bar1Length, bar2Length, fill) = getBarLengths(usedCals: Float(usedCals), totalCals: Float(totalCals) ?? 2000)
                        
                        if fill == "blue"{
                            Rectangle()
                                .fill(.blue)
                                .frame(width: CGFloat(bar1Length), height: 20)
                        }else if fill == "red"{
                            Rectangle()
                                .fill(.red)
                                .frame(width: CGFloat(bar1Length), height: 20)
                        }else{
                            Rectangle()
                                .fill(.yellow)
                                .frame(width: CGFloat(bar1Length), height: 20)
                        }
                        
                        Rectangle()
                            .fill(.quaternary)
                            .frame(width: CGFloat(bar2Length), height: 20)
                    }
                    Text("\(Int(usedCals)) / \(Int(totalCals) ?? 2000)")
                }
                
                
                
                NavigationLink{
                    FoodSearch(foodsEaten: $foodsEaten, usedCals: $usedCals)
                        .navigationBarTitle("")
                } label: {
                    Text("Search for a food.")
                }
                .navigationBarTitle("")
                .padding(.vertical, 0.5)
            }
            
            
            List{
                ForEach(foodsEaten) { food in
                    
                    
                            ZStack{
                                HStack{
                                    Text(food.name + "\ncals: " +
                                         String(Int(food.calories)))
                                    
                                    NavigationLink{
                                        FoodDetails(foodsEaten: $foodsEaten, usedCals: $usedCals, food: food, add: false)
                                    } label: {
                                        EmptyView()
                                    }
                                    .opacity(0.0)
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
            }
            Spacer()
        }
    }
}
    
func addNew(foodsEaten: inout [Food], usedCals: inout Float, food: inout Food, servings: String){
        if food.name != ""{
            
            var maxId = 0
            for tempFood in foodsEaten{
                if tempFood.id >= maxId{
                    maxId = tempFood.id
                }
            }
            
            food.id = maxId + 1
            food.calories *= (Float(servings) ?? 1)
            
            print(food)
            
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
