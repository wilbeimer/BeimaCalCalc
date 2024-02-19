//
//  Settings.swift
//  BeimaCalCalc_2.0
//
//  Created by Wilson Beima on 2/12/24.
//

import SwiftUI

struct Settings: View {    
    @Binding var totalCals: String
    @Binding var proteinGoal: String
    @Binding var fatGoal: String
    @Binding var carbGoal: String
    
    var body: some View {
        VStack{
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack() {
                Text("Calorie Goal: ").bold().font(.headline)
                
                VStack(alignment: .leading) {
                    TextField("", text: $totalCals)
                        //.background(RoundedRectangle(cornerRadius: 4)
                          //  .stroke()).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                }
                .font(.subheadline)
            }.padding(.horizontal, 30).padding(.vertical, 10)
            
            HStack() {
                Text("Protein Goal: ").bold().font(.headline)
                
                VStack(alignment: .leading) {
                    TextField("", text: $proteinGoal)
                        //.background(RoundedRectangle(cornerRadius: 4)
                          //  .stroke()).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                }
                .font(.subheadline)
            }.padding(.horizontal, 30).padding(.vertical, 10)
            
            HStack() {
                Text("Carb Goal: ").bold().font(.headline)
                
                VStack(alignment: .leading) {
                    TextField("", text: $carbGoal)
                        //.background(RoundedRectangle(cornerRadius: 4)
                          //  .stroke()).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                }
                .font(.subheadline)
            }.padding(.horizontal, 30).padding(.vertical, 10)
            
            HStack() {
                Text("Fat Goal: ").bold().font(.headline)
                
                VStack(alignment: .leading) {
                    TextField("", text: $fatGoal)
                        //.background(RoundedRectangle(cornerRadius: 4)
                          //  .stroke()).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                }
                .font(.subheadline)
            }.padding(.horizontal, 30).padding(.vertical, 10)
            
            Spacer()
        }
    }
}
