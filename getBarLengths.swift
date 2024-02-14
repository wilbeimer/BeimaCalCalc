//
//  getBarLengths.swift
//  BeimaCalCalc
//
//  Created by Wilson Beima on 11/19/23.
//

import Foundation

func getBarLengths(usedCals: Float, totalCals: Float)-> (Float, Float, String){
    let totalBarLength: Float = 300
    
    let lengthPerCal = totalBarLength/totalCals
        
    var bar1Length = lengthPerCal * usedCals
    
    var fill = "blue"
    
    if (bar1Length > 320){
        fill = "red"
    }else if (bar1Length > 300){
            bar1Length = 300
            fill = "yellow"
    }
    
    let bar2Length = totalBarLength - bar1Length
    
    return (bar1Length, bar2Length, fill)
}
