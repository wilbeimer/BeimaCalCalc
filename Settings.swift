//
//  Settings.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 2/12/24.
//

import SwiftUI

struct Settings: View {    
    @Binding var totalCals: String
    
    var body: some View {
        VStack{
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack() {
                Text("Your Calories: ").bold().font(.headline)
                
                VStack(alignment: .leading) {
                    TextField("", text: $totalCals)
                        //.background(RoundedRectangle(cornerRadius: 4)
                          //  .stroke()).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                }
                .font(.subheadline)
            }.padding(.horizontal, 30).padding(.vertical, 10)
            
            Spacer()
        }
    }
}
