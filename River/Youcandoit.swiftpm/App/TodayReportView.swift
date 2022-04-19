//
//  SwiftUIView.swift
//  
//
//  Created by 이가은 on 2022/04/19.
//

import SwiftUI


class User1 : ObservableObject {
    
    @Published var name : String = "Gaeun"
    
    struct RecordTime {
        var emotion : Int
        var emotionOpacity : Double
        var emotionDetailSelectedDic : [String: Int]
    }
    
    @Published var First : RecordTime = RecordTime(emotion: 5, emotionOpacity: 5.0, emotionDetailSelectedDic: [
        "upset":3,
        "furious":6,
        "anxious":10,
        "upset1":3,
        "furious1":6,
        "anxious1":10,
        "upset2":3,
        "furious2":6,
        "anxious2":10,
        "upset3":3,
        "furiou4s":6,
        "anxious4":10,
    ])
    
}


struct TodayReportView: View {
    
    @ObservedObject var user: User
    //    @ObservedObject var user : User1 = User1()
    
    //    @State var selecitionContext = 0
    
    @State var isNavigationLinkActive = false
    
    //    let TodayReportViewContext : [String] = [
    //        "Why do you want to keep it?",
    //        "What do you do with this feeling?"
    //    ]
    
//    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
       
            VStack{
                HStack{
                    HeartEatingView(selectionFeeling: $user.First.emotion)
                        .frame(width: 200, height: 200)
                        Image(systemName: "heart.fill")
                            .font(.system(size: 150))
                            .overlay(
                                Text(feelingFood[user.First.emotion])
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(Color.black)
                            )
                            .foregroundColor(Color.init(red: feelingFoodColor[user.First.emotion][0], green: feelingFoodColor[user.First.emotion][1], blue: feelingFoodColor[user.First.emotion][2],opacity: Double(user.First.emotionOpacity/100))
                            )
                        VStack{
                            let DetailFeelingArray = user.First.emotionDetailSelectedDic.sorted {
                                return $0.1 > $1.1
                            }
                            ForEach(DetailFeelingArray.indices, id: \.self){ index in
                                if(index < 4){
                                    Text("\(DetailFeelingArray[index].key): \(DetailFeelingArray[index].value)")
                                        .frame(width: 150, height: 30)
                                        .padding(10)
                                        .background(Color.init(red: feelingFoodColor[user.First.emotion][0], green: feelingFoodColor[user.First.emotion][1], blue: feelingFoodColor[user.First.emotion][2],opacity: 0.2))
                                        .cornerRadius(20)
                            }
                        }
                    }//: VStack
                }
            }//: HStack
            ContextBoxView(context: "What do you do with this feeling?")
        NavigationLink(destination: ChangeEmotionView(user: user), isActive: $isNavigationLinkActive){
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

