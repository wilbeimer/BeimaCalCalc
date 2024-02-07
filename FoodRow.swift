//
//  FoodRow.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 2/5/24.
//

import SwiftUI

struct FoodRow: View {
    var food: Food

    var body: some View {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text("🍔")
                        .font(.title)
                        .padding(.trailing, 12)
                    
                    VStack(alignment: .leading) {
                        Text(food.name).bold()
                        
                        VStack(alignment: .leading) {
                            Text("Protein: \(Int(food.protein))")
                            Text("Carbs: \(Int(food.carbohydrates))")
                            
                        }
                        .font(.caption)
                    }
                }
            }
            Divider().padding(.bottom, 12).padding(.top, 8)
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12.0)
    }
}
