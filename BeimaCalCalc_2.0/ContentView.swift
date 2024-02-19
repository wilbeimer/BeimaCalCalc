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
    
    @State var servings: String = "1"
    
    @State var protein = 0
    @State var fat = 0
    @State var carbs = 0
    
    @State var proteinGoal = "0.25"
    @State var fatGoal = "0.2"
    @State var carbGoal = "0.5"
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(spacing: 240){
                    Text("Wilson Beima")
                    
                    NavigationLink{
                        Settings(totalCals: $totalCals, proteinGoal: $proteinGoal, fatGoal: $fatGoal, carbGoal: $carbGoal)
                        } label: {
                            Text ("⚙")
                        }
                }
                
                HStack(spacing: 40){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("<")
                    })
                    
                    Text("Today").font(.title2).foregroundColor(colorScheme == .dark ? .blue : .blue).onTapGesture(perform: { fuckAlex.toggle()})
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text(">")
                    })
                    
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
                    FoodSearch(servings: $servings, foodsEaten: $foodsEaten, usedCals: $usedCals)
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
                                FoodDetails(foodsEaten: $foodsEaten, usedCals: $usedCals, servings: $servings, food: food, add: false)
                            } label: {
                                        EmptyView()
                                    }
                                    .opacity(0.0)
                                    .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            Spacer(minLength: 300)
            
            HStack{
                let (protein,carbs,fat) = doSomething(foodsEaten: foodsEaten, protein: &protein, fat: &fat, carbs: &carbs)
                
                let totalProtein = Int(((Double(totalCals) ?? 2000.0) * (Double(proteinGoal) ?? 0.25)/4))
                let totalFat = Int(((Double(totalCals) ?? 2000.0) * (Double(fatGoal) ?? 0.2)/4))
                let totalCarbs = Int(((Double(totalCals) ?? 2000.0) * (Double(carbGoal) ?? 0.5)/9))
                
                @State var proteinAngle: CGFloat = 360/( CGFloat(totalProtein/protein))
                @State var carbAngle: CGFloat = 360/( CGFloat(totalCarbs/carbs))
                @State var fatAngle: CGFloat = 360/( CGFloat(totalFat/fat))
                
                VStack{
                    Text("Protein")
                    
                    VStack(spacing: -120){
                        Text("\(protein - 1)/\(totalProtein)")
                        PieChart(x:65,y:200,radius:60,angle: $proteinAngle)
                    }
                }
                
                VStack{
                    Text("Fat")
                    
                    VStack(spacing: -120){
                        Text("\(carbs - 1)/\(totalCarbs)")
                        PieChart(x:65,y:200,radius:60,angle: $carbAngle)
                    }
                }
                
                VStack{
                    Text("Carbs")
                    
                    VStack(spacing: -120){
                        Text("\(fat - 1)/\(totalFat)")
                        PieChart(x:65,y:200,radius:60,angle: $fatAngle)
                    }
                }
            }
        }
    }
}
    
func addNew(foodsEaten: inout [Food], usedCals: inout Float, food: inout Food, servings: String, tempServings: String){
        if food.name != ""{
            
            var maxId = 0
            for tempFood in foodsEaten{
                if tempFood.id >= maxId{
                    maxId = tempFood.id
                }
            }
            
            food.id = maxId + 1
            
            /*
            print(tempServings)
            print(servings)
            food.calories = (((food.calories) / (Float(tempServings) ?? 1)) * (Float(servings) ?? 1))
            
            print("calories: \(food.calories)")
             */
            
            food.protein *= (Float(servings) ?? 1)
            food.fat *= (Float(servings) ?? 1)
            food.carbohydrates *= (Float(servings) ?? 1)
            
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
