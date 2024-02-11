//
//  FoodSearch.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 2/6/24.
//

import SwiftUI

struct FoodSearch: View {
    @EnvironmentObject var foods: Foods
    
    @Binding var foodsEaten: [Food]
    @Binding var usedCals: Float

    var body: some View {
        NavigationView{
            VStack(spacing: 30) {
                VStack(alignment: .leading) {
                    Text("Foods")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Browse our selection of the finest foods")
                }
                
                VStack(alignment: .leading) {
                    TextField("Search", text: $foods.searchText)
                        .font(.body)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.2662717301)))
                        .cornerRadius(20)
                        .onChange(of: foods.searchText) { text in
                            foods.filterContent()
                        }
                }
                .padding(.horizontal, 50)
                
                ScrollView {
                    LazyVStack{
                        if foods.filteredFoodList.count > 0 {
                            ForEach(foods.filteredFoodList) { food in
                                
                                NavigationLink{
                                    FoodDetails(foodsEaten: $foodsEaten, usedCals: $usedCals, food: food)
                                } label: {
                                    FoodRow(food: food)
                                        .padding(.horizontal)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .navigationBarTitle("")
                            }
                        } else {
                            Text("No foods found 😥")
                        }
                    }
                }                .padding(.horizontal)
            }
        }
    }
}
