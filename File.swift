//
//  File.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 2/16/24.
//

import Foundation

func doSomething(foodsEaten: [Food], protein: inout Int, fat: inout Int, carbs: inout Int) -> (Int,Int,Int){
    
    for food in foodsEaten{
        protein += Int(food.protein)
        fat += Int(food.fat)
        carbs += Int(food.carbohydrates)
    }
    
    
    if protein == 0{
        protein = 1
    }
    if carbs == 0{
        carbs = 1
    }
    if fat == 0{
        fat = 1
    }
    
    return (protein,fat,carbs)
}
