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
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    
    //feelingDetail[feelingFood[selectionFeeling]].count
    //   @Binding var feelingAmount : [Int]
    @State private var feelingAmount = Array(repeating: 0, count: 13)
    
    
    //   @Binding var feelingDetailMeaning : String = feelingDetailDictionary[feelingDetail[feelingFood[selectionFeeling]]![0]]!
    @State private var feelingDetailMeaning : String = feelingDetailDictionary[feelingDetail[feelingFood[5]]![0]]!
//    feelingFood[5][0]
    
    //   @Binding var feelingDetailMeaning : String = feelingFood[selectionFeeling][0]
    @State private var feelingDetailSelected : String = feelingDetail[feelingFood[5]]![0]
    
    @State private var heartOpacity : Double = 5
    
    var body: some View {
        
        Image(systemName: "heart.fill")
            .font(.system(size: 400))
            .overlay(
                VStack{
                    Text(feelingFood[selectionFeeling])
                        .font(.title)
                        .foregroundColor(Color.black)
                    Text(feelingDetailSelected)
                        .font(.title2)
                        .foregroundColor(Color.black)
                    Text(feelingDetailMeaning)
                        .foregroundColor(Color.black)
                }
            )
            .foregroundColor(Color.init(red: feelingFoodColor[selectionFeeling][0], green: feelingFoodColor[selectionFeeling][1], blue: feelingFoodColor[selectionFeeling][2],opacity: Double(heartOpacity/100)))
        if(heartOpacity == 5){
            ContextBoxView(context: "Tell me more about it !")
        }else{
            ContextBoxView(context: "The more detailed it is, the better 🎨")
        }
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(feelingDetail[feelingFood[selectionFeeling]]!.indices, id: \.self){ index in
                
                let currentFeeling = feelingDetail[feelingFood[selectionFeeling]]
                
                Stepper(onIncrement: {
                    print("Stepper onIncrement")
                    heartOpacity += 5
                    self.feelingAmount[index] += 1
                    self.feelingDetailMeaning = feelingDetailDictionary[currentFeeling![index]]!
                    self.feelingDetailSelected = currentFeeling![index]
                }, onDecrement: {
                    print("Stepper onDecrement")
                    heartOpacity -= 5
                    self.feelingAmount[index] -= 1
                    self.feelingDetailMeaning = feelingDetailDictionary[currentFeeling![index]]!
                    self.feelingDetailSelected = currentFeeling![index]
                }) {
                    Text("\(currentFeeling![index]): \(self.feelingAmount[index])")
                }.padding(.horizontal, 10)
            }
        }
    }
}

struct RecordDetailFeelingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordDetailFeelingView()
    }
}
