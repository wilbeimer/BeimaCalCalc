//
//  Food.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 12/28/23.
//

import Foundation

struct Food: Codable, Identifiable, Equatable{
    
    var id: Int
    let name: String
    var calories: Float
    var protein: Float
    var carbohydrates: Float
    var fat: Float
    let description: String
    
    /*
    let id: Int
    let name: String
    let foodGroup: String
    let calories: Float
    let fat: Float
    let protein: Float
    let carbs: Float
    let sugars: Float
    let fiber: Float
    
    let cholesterol: Float
    let saturatedFats: Float
    let calcium: Float
    
    let sodium: Float
    let alcohol: Float
    let caffeine: Float
    let servingWeight: Float
    let servingDescription: String
    */
}
