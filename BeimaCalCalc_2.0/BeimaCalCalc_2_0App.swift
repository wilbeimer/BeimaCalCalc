//
//  BeimaCalCalc_2_0App.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 12/28/23.
//

import SwiftUI

@main
struct BeimaCalCalc_2_0App: App {
    var foods = Foods() // Initialize your ViewModel
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(foods)
        }
    }
}
