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
    
    @State var servings: String = "1"
    
    @State var food: Food
        
    var add: Bool
    
    var body: some View {
        
        @State var tempFood = food
        
        VStack{
            
            Text(String(tempFood.calories))
            Text(tempFood.name)
            Text("Calories: "+String(tempFood.calories * (Float(servings) ?? 1)))
            Text("Protein: "+String(tempFood.protein))
            Text("Carbs: "+String(tempFood.carbohydrates))
            Text("Fat: "+String(tempFood.fat))
            
            Spacer()
            
            if add == true{
                VStack(alignment: .leading) {
                    TextField("", text: $servings)
                }
                Spacer()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    addNew(foodsEaten: &foodsEaten, usedCals: &usedCals, food: &tempFood, servings: servings)}, label: {
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
