//
//  FoodDetails.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 2/6/24.
//

import SwiftUI
import Foundation

struct FoodDetails: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var foodsEaten: [Food]
    @Binding var usedCals: Float
    
    @Binding var servings: String
    
    @State var food: Food
        
    var add: Bool
    
    var body: some View {
        
        @State var tempFood = food
        let tempServings = servings
        
        VStack{
            Text("Calories: "+String(tempFood.calories))
            Text("Protein: "+String(tempFood.protein * (Float(servings) ?? 1)))
            Text("Carbs: "+String(tempFood.carbohydrates * (Float(servings) ?? 1)))
            Text("Fat: "+String(tempFood.fat * (Float(servings) ?? 1)))
            
            Spacer()
            
            VStack(alignment: .leading) {
                Form{
                    TextField("", text: $servings).onSubmit({
                        print("Commited")
                        if let idx = foodsEaten.firstIndex(of: food ) {
                            foodsEaten.remove(at: idx)
                            
                            usedCals -= food.calories
                            
                            addNew(foodsEaten: &foodsEaten, usedCals: &usedCals, food: &tempFood, servings: servings, tempServings: tempServings)
                        }
                    }).keyboardType(.numberPad)
                }
            }
            Spacer()
            
            if add == true{
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    addNew(foodsEaten: &foodsEaten, usedCals: &usedCals, food: &tempFood, servings: servings, tempServings: tempServings)
                }, label: {
                    Text("Add")
                })
                
            }else{
                
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    if let idx = foodsEaten.firstIndex(of: food ) {
                        foodsEaten.remove(at: idx)
                        
                        usedCals -= food.calories
                    }
                }, label: {
                    Text("Remove")
                })
                
            }
        }
    }
}
