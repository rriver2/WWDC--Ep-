//
//  ChangeFeelingRecordDetailFeelingView.swift
//
//
//  Created by 이가은 on 2022/04/19.
//

import SwiftUI

struct ChangeFeelingRecordDetailFeelingView: View {
    
    @ObservedObject var user: User
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    @State var isNavigationLinkActive = false
    
    @State private var feelingAmount = Array(repeating: 0, count: 13)
    
    @State private var feelingDetailSelectedIndex : Int = 0
    
    func onIncrement(_ index : Int){
        user.Second.emotionOpacity += 5
        self.feelingAmount[index] += 1
        feelingDetailSelectedIndex = index
        user.Second.emotionDetailSelectedDic[Feelings[feelingFood[5]]![index].name] = self.feelingAmount[index]
    }
    
    func onDecrement(_ index : Int){
        if(self.feelingAmount[index] > 0){
            user.Second.emotionOpacity -= 5
            self.feelingAmount[index] -= 1
            feelingDetailSelectedIndex = index
        }
        if(self.feelingAmount[index] <= 0){
            user.Second.emotionDetailSelectedDic.removeValue(forKey: Feelings[feelingFood[5]]![index].name)
        }else{
            user.Second.emotionDetailSelectedDic[Feelings[feelingFood[5]]![index].name] = self.feelingAmount[index]
        }
    }
    
    var body: some View {
            VStack{
                Text(feelingFood[user.Second.emotion])
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                
                if(user.Second.emotionOpacity == 5){
                    Image(systemName: "heart.fill")
                        .font(.system(size: 400))
                        .overlay(
                            Text("Tell me more about it !")
                                .font(.title)
                                .foregroundColor(Color.black)
                        )
                        .foregroundColor(Color.init(red: feelingFoodColor[user.Second.emotion][0], green: feelingFoodColor[user.Second.emotion][1], blue: feelingFoodColor[user.Second.emotion][2],opacity: Double(user.Second.emotionOpacity/100)))
                }else{
                    Image(systemName: "heart.fill")
                        .font(.system(size: 400))
                        .overlay(
                            VStack{
                                Text(Feelings[feelingFood[user.Second.emotion]]![feelingDetailSelectedIndex].name)
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .padding(.bottom,10)
                                Text(Feelings[feelingFood[user.Second.emotion]]![feelingDetailSelectedIndex].meaning)
                                    .foregroundColor(Color.black)
                            }.frame(width: 250,  alignment: .center)
                        )
                        .foregroundColor(Color.init(red: feelingFoodColor[user.Second.emotion][0], green: feelingFoodColor[user.Second.emotion][1], blue: feelingFoodColor[user.Second.emotion][2],opacity: Double(user.Second.emotionOpacity/100)))
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(Feelings[feelingFood[user.Second.emotion]]!.indices, id: \.self){ index in
                        
                        VStack{
                            Text("\(Feelings[feelingFood[user.Second.emotion]]![index].name): \(self.feelingAmount[index])")
                            HStack{
                                Button(action: {
                                    onDecrement(index)
                                }){
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 30, height: 30)
                                        .overlay {
                                            Text("-")
                                                .font(.system(size: 20))
                                                .foregroundColor(Color.black)
                                        }
                                }
                                Button(action: {
                                    onIncrement(index)
                                }) {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 30, height: 30)
                                        .overlay {
                                            Text("+")
                                                .font(.system(size: 20))
                                                .foregroundColor(Color.black)
                                        }
                                }
                            }
                        }
                        .frame(width: 150, height: 50)
                        .padding()
                        .background(Color.init(red: feelingFoodColor[user.Second.emotion][0], green: feelingFoodColor[user.Second.emotion][1], blue: feelingFoodColor[user.Second.emotion][2],opacity: 0.2))
                        .cornerRadius(20)
                    }
                }
            }
        
            NavigationLink(destination: ChangeReportView(user : user), isActive: $isNavigationLinkActive){
        }
        .navigationBarItems(trailing:
                                Button(action: {
            self.isNavigationLinkActive = true
        }) {
            Text("Next")
        })
    }
}

//struct ChangeFeelingRecordDetailFeelingView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangeFeelingRecordDetailFeelingView()
//    }
//}
