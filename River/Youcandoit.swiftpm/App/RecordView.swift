//
//  EatingView.swift
//  WWDC
//
//  Created by 이가은 on 2022/04/16.
//

import SwiftUI

struct FeelingFood{
    
    var feelingFood = ["Happiness", "Energized", "Comfort", "Boredom", "Depression / Sad", "Anger", "Anxiety /     Fear", "Confusion"]
    
    var feelingFoodColor : [[Double]] = [
        [249/255, 217/255, 85/255],
        [226/255, 149/255, 76/255],
        [142/255, 163/255, 141/255],
        [129/255, 129/255, 129/255],
        [102/255, 153/255, 200/255],
        [193/255, 43/255, 31/255],
        [76/255, 88/255, 81/255],
        [159/255, 95/255, 161/255],
    ]
}

struct RecordView: View {
    @State var selectionFeeling = 0
    @ObservedObject var user : User = User()
    
    @State private var firstFeeling: String = ""
    
    @State var isNavigationLinkActive = false
    
    var Food = FeelingFood()
    
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            HStack{
                VStack{
                    ForEach([0,1,2,3], id: \.self){ index in
                        Button {
                            selectionFeeling = index
                        } label: {
                            HStack{
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 150))
                                    .overlay(
                                        Text(Food.feelingFood[index])
                                            .font(.title)
                                            .foregroundColor(Color.black)
                                    )
                                    .foregroundColor( selectionFeeling == index
                                                      ? Color.init(red: Food.feelingFoodColor[index][0], green: Food.feelingFoodColor[index][1], blue: Food.feelingFoodColor[index][2],opacity: 0.8)
                                                      : Color.init(red: Food.feelingFoodColor[index][0], green: Food.feelingFoodColor[index][1], blue: Food.feelingFoodColor[index][2],opacity: 0.2)
                                    )
                                
                            }
                        }
                    }
                }
                HeartEatingView(selectionFeeling: $selectionFeeling)
                VStack{
                    ForEach([4,5,6,7], id: \.self){ index in
                        Button {
                            selectionFeeling = index
                        } label: {
                            HStack{
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 150))
                                    .overlay(
                                        Text(Food.feelingFood[index])
                                            .font(.title)
                                            .foregroundColor(Color.black)
                                    )
                                //                                    .foregroundColor(Color.init(red: Food.feelingFoodColor[index][0], green: Food.feelingFoodColor[index][1], blue: Food.feelingFoodColor[index][2]))
                                //                                    .foregroundColor( selectionFeeling == index
                                    .foregroundColor( selectionFeeling == index
                                                      ? Color.init(red: Food.feelingFoodColor[index][0], green: Food.feelingFoodColor[index][1], blue: Food.feelingFoodColor[index][2],opacity: 0.8)
                                                      : Color.init(red: Food.feelingFoodColor[index][0], green: Food.feelingFoodColor[index][1], blue: Food.feelingFoodColor[index][2],opacity: 0.2)
                                    )
                            }
                        }
                    }
                }
            }
            Spacer()
            ContextBoxView(context: "Tell me today’s emotions 😚")

            NavigationLink(destination: RecordDetailFeelingView(), isActive: $isNavigationLinkActive) {
                Button(action: {
                    self.isNavigationLinkActive = true
                }) {
                    Text("Next")
                }
            }
            Spacer()
        }
    }
}


struct HeartEatingView : View{
    @Binding var selectionFeeling : Int
    
    var body : some View{
        Image("feeling\(selectionFeeling)")
            .resizable()
            .frame(width: 400, height: 400)
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
