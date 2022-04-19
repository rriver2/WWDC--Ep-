//
//  ChangeReportView.swift
//
//
//  Created by 이가은 on 2022/04/19.
//

import SwiftUI

struct ChangeReportView: View {
    
    @ObservedObject var user: User
    
    @State var isNavigationLinkActive = false
    
    var body: some View {
        
        HStack{
            HStack{
                HeartEatingView(selectionFeeling: $user.First.emotion)
                    .frame(width: 150, height: 150)
                VStack{
                    let DetailFeelingArray = user.First.emotionDetailSelectedDic.sorted {
                        return $0.1 > $1.1
                    }
                    ForEach(DetailFeelingArray.indices, id: \.self){ index in
                        if(index < 4){
                            Text("\(DetailFeelingArray[index].key): \(DetailFeelingArray[index].value)")
                                .padding(10)
                                .background(Color.init(red: feelingFoodColor[user.First.emotion][0], green: feelingFoodColor[user.First.emotion][1], blue: feelingFoodColor[user.First.emotion][2],opacity: 0.2))
                                .cornerRadius(15)
                        }
                    }
                }//: VStack
            }
            
            Image(systemName: "arrow.forward")
                .font(.system(size: 40))
            
            HStack{
                HeartEatingView(selectionFeeling: $user.Second.emotion)
                    .frame(width: 150, height: 150)
                VStack{
                    let DetailFeelingArray = user.Second.emotionDetailSelectedDic.sorted {
                        return $0.1 > $1.1
                    }
                    ForEach(DetailFeelingArray.indices, id: \.self){ index in
                        if(index < 4){
                            Text("\(DetailFeelingArray[index].key): \(DetailFeelingArray[index].value)")
                                .padding(10)
                                .background(Color.init(red: feelingFoodColor[user.Second.emotion][0], green: feelingFoodColor[user.Second.emotion][1], blue: feelingFoodColor[user.Second.emotion][2],opacity: 0.2))
                                .cornerRadius(15)
                        }
                    }
                }//: VStack
            }
        }//: HStack
        ContextBoxView(context: "And if you want, think about what you should do to change your feelings and press the button below")
        NavigationLink(destination: LastView(cheerUpContext: ChangeLastViewContext), isActive: $isNavigationLinkActive){
        }
        .navigationBarItems(trailing:
                                Button(action: {
            self.isNavigationLinkActive = true
        }){
            Text("Next")
        })
        DrawingHomeView()
    }//: VStack
}

