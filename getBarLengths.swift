//
//  getBarLengths.swift
//  BeimaCalCalc
//
//  Created by Wilson Beima on 11/19/23.
//

import Foundation

let totalCals: Float = 2000

func getBarLengths(usedCals: Float)-> (Float, Float){
    let totalBarLength: Float = 300
    
    let lengthPerCal = totalBarLength/totalCals
        
    var bar1Length = lengthPerCal * usedCals
        
    if (bar1Length > 300){
            bar1Length = 300
    }
    
    let bar2Length = totalBarLength - bar1Length
    
    return (bar1Length, bar2Length)
}
