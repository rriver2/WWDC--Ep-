//
//  EatingView.swift
//  WWDC
//
//  Created by 이가은 on 2022/04/16.
//

import SwiftUI

struct RecordView: View {
    @State var selectionFeeling = 0
    @ObservedObject var user : User = User()
    
    @State private var firstFeeling: String = ""
    
    @State var isNavigationLinkActive = false
    
    
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
                                        Text(feelingFood[index])
                                            .font(.title)
                                            .foregroundColor(Color.black)
                                    )
                                    .foregroundColor( selectionFeeling == index
                                                      ? Color.init(red: feelingFoodColor[index][0], green: feelingFoodColor[index][1], blue: feelingFoodColor[index][2],opacity: 0.8)
                                                      : Color.init(red: feelingFoodColor[index][0], green: feelingFoodColor[index][1], blue: feelingFoodColor[index][2],opacity: 0.2)
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
                                        Text(feelingFood[index])
                                            .font(.title)
                                            .foregroundColor(Color.black)
                                    )
                                //                                    .foregroundColor(Color.init(red: feelingFoodColor[index][0], green: feelingFoodColor[index][1], blue: feelingFoodColor[index][2]))
                                //                                    .foregroundColor( selectionFeeling == index
                                    .foregroundColor( selectionFeeling == index
                                                      ? Color.init(red: feelingFoodColor[index][0], green: feelingFoodColor[index][1], blue: feelingFoodColor[index][2],opacity: 0.8)
                                                      : Color.init(red: feelingFoodColor[index][0], green: feelingFoodColor[index][1], blue: feelingFoodColor[index][2],opacity: 0.2)
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
