//
//  SwiftUIView.swift
//  
//
//  Created by 이가은 on 2022/04/19.
//

import SwiftUI

struct ChangeEmotionView: View {
    
    @ObservedObject var user: User
    
    @State var isNavigationLinkActive = false
    
    var body: some View {
        VStack{
            HStack{
            Image(systemName: "heart.fill")
                .font(.system(size: 150))
                .overlay(
                    Text(feelingFood[user.FirstFeeling])
                        .font(.system(size: 30))
                        .foregroundColor(Color.black)
                )
                .foregroundColor(Color.init(red: feelingFoodColor[user.FirstFeeling][0], green: feelingFoodColor[user.FirstFeeling][1], blue: feelingFoodColor[user.FirstFeeling][2],opacity: Double(user.FirstFeelingOpacity/100))
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
            
            ContextBoxView(context: "Do you want to change today's emotion?")
            
            HStack{
                
//                 다음 감정 선택하러 이동
                NavigationLink(destination: TodayReportView(user : user), isActive: $isNavigationLinkActive) {
                    Button(action: {
                        self.isNavigationLinkActive = true
                    }) {
                        Text("Yes")
                            .font(.system(size: 40))
                            .padding(.horizontal,30)
                            .padding(.vertical,20)
                            .background(Color.init(red: feelingFoodColor[user.FirstFeeling][0], green: feelingFoodColor[user.FirstFeeling][1], blue: feelingFoodColor[user.FirstFeeling][2],opacity: 0.2))
                            .cornerRadius(20)
                    }
                }
                
                // 오늘의 리포트 나옴
                NavigationLink(destination: TodayReportView(user : user), isActive: $isNavigationLinkActive) {
                    Button(action: {
                        self.isNavigationLinkActive = true
                    }) {
                        Text("No")
                            .font(.system(size: 40))
                            .padding(.horizontal,30)
                            .padding(.vertical,20)
                            .background(Color.init(red: feelingFoodColor[user.FirstFeeling][0], green: feelingFoodColor[user.FirstFeeling][1], blue: feelingFoodColor[user.FirstFeeling][2],opacity: 0.2))
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
}

//struct ChangeEmotionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangeEmotionView()
//    }
//}
