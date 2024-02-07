//
//  Foods.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 12/28/23.
//

import Foundation

final class Foods: ObservableObject {
    var foodList: [Food] = []
    @Published var filteredFoodList: [Food] = []
    
    @Published var searchText = ""
    
    func filterContent() {
        let keywordRegex = "\\b(\\w*" + searchText.lowercased() + "\\w*)\\b"

        if searchText.count > 1 {
            print("searching... ")
            
            var matchingFoods: [Food] = []
            foodList.forEach { food in
                let searchContent = food.name
                if searchContent.lowercased().range(of: keywordRegex, options: .regularExpression) != nil {
                    matchingFoods.append(food)
                }
            }
            self.filteredFoodList = matchingFoods
        } else {
            filteredFoodList = foodList
        }
    }
    
    init() {
        if let path = Bundle.main.path(forResource: "FoodNutrition", ofType: "json") {
            do {
                print("\n JSON: \n")
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                self.foodList += try decoder.decode([Food].self, from: data)
                // Now, foodList contains the decoded data from the JSON file
                
                print(self.foodList.count)
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        else{
            print("go fuck yourself")
        }
    }
}
