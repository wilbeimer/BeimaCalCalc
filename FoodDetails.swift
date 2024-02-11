//
//  FoodDetails.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 2/6/24.
//

import SwiftUI
import Foundation

struct FoodDetails: View {
    
    @Binding var foodsEaten: [Food]
    @Binding var usedCals: Float
    
    var food: Food
    
    var body: some View {
        VStack{
            Spacer()
            
            Button(action: {addNew(foodsEaten: &foodsEaten, usedCals: &usedCals, food: food)}, label: {
                Text("Add")
            })
            
        }
    }
}
