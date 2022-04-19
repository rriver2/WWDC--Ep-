//
//  SwiftUIView.swift
//  
//
//  Created by 이가은 on 2022/04/19.
//

import SwiftUI

struct RecordDetailFeelingView: View {
    
    //    @Binding var selectionFeeling : Int
    
    var selectionFeeling : Int = 5
    
    var Food = FeelingFood()
    
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    @State private var feelingAmount = Array(repeating: 0, count: 4)
    
    @State private var heartOpacity : Double = 5
    
    func incrementStep() {
        heartOpacity += 5
    }
    
    func decrementStep() {
        heartOpacity -= 5
    }
    
    var body: some View {
        
        Image(systemName: "heart.fill")
            .font(.system(size: 400))
            .overlay(
                Text(Food.feelingFood[selectionFeeling])
                    .font(.title)
                    .foregroundColor(Color.black)
            )
            .foregroundColor(Color.init(red: Food.feelingFoodColor[selectionFeeling][0], green: Food.feelingFoodColor[selectionFeeling][1], blue: Food.feelingFoodColor[selectionFeeling][2],opacity: Double(heartOpacity/100)))
        
        ContextBoxView(context: "Tell me more about it !")
        LazyVGrid(columns: columns, spacing: 20) {
            
            Stepper(value: $feelingAmount[0], in: 0...100, step: 10) {
                Text("mad : \(feelingAmount[0])")
            }.padding(.horizontal, 10)
            Stepper(value: $feelingAmount[1], in: 0...100, step: 10) {
                Text("bothersome : \(feelingAmount[1])")
            }.padding(.horizontal, 10)
            Stepper(value: $feelingAmount[2], in: 0...100, step: 10) {
                Text("furious : \(feelingAmount[2])")
            }.padding(.horizontal, 10)
            
            
//            Stepper(onIncrement: incrementStep,
//                    onDecrement: decrementStep) {
//                Text("2ㅇㅇㅇ : \(feelingAmount[2])")
//            }.padding(.horizontal, 10)
//
//            Stepper(onIncrement: {
//                print("Stepper onIncrement")
//                    heartOpacity += 5
//                self.feelingAmount[4] += 1
//            }, onDecrement: {
//                print("Stepper onDecrement")
//                    heartOpacity -= 5
//                self.feelingAmount[4] -= 1
//            }) {
//                Text("Stepper value: \(self.feelingAmount[4])")
//            }
            
        }
    }
}

struct RecordDetailFeelingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordDetailFeelingView()
    }
}
