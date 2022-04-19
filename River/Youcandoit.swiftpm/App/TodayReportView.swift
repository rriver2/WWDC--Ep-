//
//  SwiftUIView.swift
//  
//
//  Created by 이가은 on 2022/04/19.
//

import SwiftUI


class User1 : ObservableObject {
    @Published var name : String = "Gaeun"
    @Published var FirstFeeling : Int = 5
    @Published var FirstFeelingOpacity : Double = 50.0
    @Published var FirstFeelingfeelingDetailSelectedDic :  [String: Int] =
    [
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
    ]
}


struct TodayReportView: View {
    
        @ObservedObject var user: User
//    @ObservedObject var user : User1 = User1()
    
    @State var selecitionContext = 0
    
    @State var isNavigationLinkActive = false
    
    let TodayReportViewContext : [String] = [
        "Why do you want to keep it?",
        "What do you do with this feeling?"
    ]
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Image(systemName: "heart.fill")
                        .font(.system(size: 150))
                        .overlay(
                            Text(feelingFood[user.FirstFeeling])
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(Color.black)
                        )
                        .foregroundColor(Color.init(red: feelingFoodColor[user.FirstFeeling][0], green: feelingFoodColor[user.FirstFeeling][1], blue: feelingFoodColor[user.FirstFeeling][2],opacity: Double(user.FirstFeelingOpacity/100))
                        )
                    LazyVGrid(columns: columns, spacing: 20) {
                        let DetailFeelingArray = user.FirstFeelingfeelingDetailSelectedDic.sorted {
                            return $0.1 > $1.1
                        }
                        ForEach(DetailFeelingArray.indices, id: \.self){ index in
                            if(index < 8){
                                Text("\(DetailFeelingArray[index].key): \(DetailFeelingArray[index].value)")
                                    .frame(width: 150, height: 50)
                                    .padding(10)
                                    .background(Color.init(red: feelingFoodColor[user.FirstFeeling][0], green: feelingFoodColor[user.FirstFeeling][1], blue: feelingFoodColor[user.FirstFeeling][2],opacity: 0.2))
                                    .cornerRadius(20)
                            }
                        }
                    }//: LazyVGrid
                }//: VStack
                Button( action: {
                    if(selecitionContext < TodayReportViewContext.count-1){
                        selecitionContext += 1
                    }
                }){
                    HeartEatingView(selectionFeeling: $user.FirstFeeling)
                        .frame(width: 300, height: 300)
                        .overlay{
                            if(selecitionContext == 0){
                                Image(systemName: "hand.tap")
                                    .padding(.bottom, 250)
                                    .padding(.leading, 200)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 50))
                            }
                        }
                }
            }//: HStack
            ContextBoxView(context: TodayReportViewContext[selecitionContext])
            if(selecitionContext == TodayReportViewContext.count-1){
                NavigationLink(destination: LastView(), isActive: $isNavigationLinkActive) {
                    Button(action: {
                        self.isNavigationLinkActive = true
                    }) {
                        Text("Next")
                            .font(.system(size: 40))
                            .padding(.horizontal,30)
                            .padding(.vertical,20)
                            .background(Color.init(red: feelingFoodColor[user.FirstFeeling][0], green: feelingFoodColor[user.FirstFeeling][1], blue: feelingFoodColor[user.FirstFeeling][2],opacity: 0.2))
                            .cornerRadius(20)
                    }
                }
            }
        }//: VStack
    }
}
//
//struct TodayReportView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayReportView()
//    }
//}
