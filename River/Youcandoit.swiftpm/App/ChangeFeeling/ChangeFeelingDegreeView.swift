//
//  SwiftUIView.swift
//  
//
//  Created by 이가은 on 2022/04/19.
//

import SwiftUI

struct ChangeFeelingDegreeView: View {
    
//    @ObservedObject var user : User1 = User1()
    
    @ObservedObject var user : User
    
    @State var isNavigationLinkActive = false
    
    var body: some View {
        VStack{
            Image(systemName: "heart.fill")
                .font(.system(size: 400))
                .overlay(
                        Text(feelingFood[user.First.emotion])
                            .font(.title)
                            .foregroundColor(Color.black)
                            .padding(.bottom,10)
                )
                .foregroundColor(Color.init(red: feelingFoodColor[user.First.emotion][0], green: feelingFoodColor[user.First.emotion][1], blue: feelingFoodColor[user.First.emotion][2],opacity: Double(user.First.emotionOpacity/100)))
            ContextBoxView(context: "How much do you want to change today’s emotion degree?")
            Slider(value: $user.First.emotionOpacity, in: 0...100,step: 1.0)
                .tint(Color.init(red: feelingFoodColor[user.First.emotion][0], green: feelingFoodColor[user.First.emotion][1], blue: feelingFoodColor[user.First.emotion][2],opacity: Double(user.First.emotionOpacity/100)))
                .padding(.horizontal,150)
                .padding(.top,30)
            NavigationLink(destination: ChangeFeelingRecordView(user: user), isActive: $isNavigationLinkActive){
            }
            .navigationBarItems(trailing:
            Button(action: {
                self.isNavigationLinkActive = true
            }){
                Text("Next")
            })
        }
    }
}

//struct ChangeFeelingDegreeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangeFeelingDegreeView()
//    }
//}
