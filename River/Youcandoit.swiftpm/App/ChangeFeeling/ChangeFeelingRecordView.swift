//
//  ChangeFeelingRecordView.swift
//  WWDC
//
//  Created by 이가은 on 2022/04/16.
//

import SwiftUI

struct ChangeFeelingRecordView: View {
    
    @ObservedObject var user: User
    
    @State var isNavigationLinkActive = false
    
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            HStack{
                VStack{
                    ForEach([0,1,2,3], id: \.self){ index in
                        Button {
                            user.Second.emotion = index
                        } label: {
                            HStack{
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 150))
                                    .overlay(
                                        Text(feelingFood[index])
                                            .font(.title)
                                            .foregroundColor(Color.black)
                                    )
                                    .foregroundColor( user.Second.emotion == index
                                                      ? Color.init(red: feelingFoodColor[index][0], green: feelingFoodColor[index][1], blue: feelingFoodColor[index][2],opacity: 0.8)
                                                      : Color.init(red: feelingFoodColor[index][0], green: feelingFoodColor[index][1], blue: feelingFoodColor[index][2],opacity: 0.2)
                                    )
                                
                            }
                        }
                    }
                }
                HeartEatingView(selectionFeeling: $user.Second.emotion)
                    .frame(width: 400, height: 400)
                VStack{
                    ForEach([4,5,6,7], id: \.self){ index in
                        Button {
                            user.Second.emotion = index
                        } label: {
                            HStack{
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 150))
                                    .overlay(
                                        Text(feelingFood[index])
                                            .font(.title)
                                            .foregroundColor(Color.black)
                                    )
                                    .foregroundColor( user.Second.emotion == index
                                                      ? Color.init(red: feelingFoodColor[index][0], green: feelingFoodColor[index][1], blue: feelingFoodColor[index][2],opacity: 0.8)
                                                      : Color.init(red: feelingFoodColor[index][0], green: feelingFoodColor[index][1], blue: feelingFoodColor[index][2],opacity: 0.2)
                                    )
                            }
                        }
                    }
                }
            }
            Spacer()
            ContextBoxView(context: "What kind of emotions do you want to change?")

            NavigationLink(destination: ChangeFeelingRecordDetailFeelingView(user : user), isActive: $isNavigationLinkActive) {
            }.navigationBarItems(trailing:
                Button(action: {
                    self.isNavigationLinkActive = true
                }) {
                    Text("Next")
                })
            Spacer()
        }
    }
}


