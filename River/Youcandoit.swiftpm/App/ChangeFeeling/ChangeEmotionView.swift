//
//  SwiftUIView.swift
//  
//
//  Created by 이가은 on 2022/04/19.
//

import SwiftUI

struct ChangeEmotionView: View {
    
    @ObservedObject var user: User
    
    @State var isChangeViewNavigationLinkActive = false
    
    @State var isLastViewNavigationLinkActive = false
    
    @State var isNavigationLinkActive = false
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "heart.fill")
                    .font(.system(size: 150))
                    .overlay(
                        Text(feelingFood[user.First.emotion])
                            .font(.system(size: 30))
                            .foregroundColor(Color.black)
                    )
                    .foregroundColor(Color.init(red: feelingFoodColor[user.First.emotion][0], green: feelingFoodColor[user.First.emotion][1], blue: feelingFoodColor[user.First.emotion][2],opacity: Double(user.First.emotionOpacity/100))
                    )
                
                Image(systemName: "arrow.forward")
                    .font(.system(size: 50))
                
                Image(systemName: "heart")
                    .font(.system(size: 150))
                    .overlay(
                        Text("?")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(Color.black)
                    )
                    .foregroundStyle(
                        .linearGradient(
                            colors: [.purple, .blue, .cyan, .green, .yellow, .orange, .red],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
            
            ContextBoxView(context: "Should I change today's feelings to a different one?")
            
            HStack{
                
                //                 다음 감정 선택하러 이동
                
                NavigationLink( destination: ChangeFeelingDegreeView(user: user), isActive: $isChangeViewNavigationLinkActive){
                    Button(action: {
                        self.isChangeViewNavigationLinkActive = true
                    }) {
                        Text("Yes")
                            .font(.system(size: 40))
                            .padding(.horizontal,30)
                            .padding(.vertical,20)
                            .background(Color.init(red: feelingFoodColor[user.First.emotion][0], green: feelingFoodColor[user.First.emotion][1], blue: feelingFoodColor[user.First.emotion][2],opacity: 0.2))
                            .cornerRadius(20)
                    }
                }
                
                NavigationLink(destination: LastView(cheerUpContext: LastViewContext), isActive: $isLastViewNavigationLinkActive) {
                }
                .navigationBarItems(trailing:
                                        Button(action: {
                    self.isLastViewNavigationLinkActive = true
                }){
                    Text("No")
                })
            }
        }
    }
}

//struct ChangeEmotionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangeEmotionView()
//    }
//}
