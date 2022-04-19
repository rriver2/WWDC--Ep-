//
//  SwiftUIView.swift
//  
//
//  Created by 이가은 on 2022/04/19.
//

import SwiftUI

struct LastView: View {
    
    
//    @ObservedObject var user: User
    @ObservedObject var user : User1 = User1()

    @State var selecitionContext = 0
    
    @State var isNavigationLinkActive = false
    
    let LastViewContext : [String] = [
        "Thank you for being honest with me today!",
        "I hope it was a time to look into your feelings.",
        "You know all the feelings you’ve given me are precious, right?",
        "I love all the emotions you've given me and all the emotions you'll feel in the future.",
        "Don't forget I'm always on your side.",
        "Much love, your heart."
    ]
    
    var body: some View {
        VStack{
            Button( action: {
                if(selecitionContext < LastViewContext.count-1){
                    selecitionContext += 1
                }
            }){
                Image("story3")
                    .resizable()
                    .frame(width: 500, height: 500)
                    .overlay{
                        if(selecitionContext == 0){
                            Image(systemName: "hand.tap")
                                .padding(.bottom, 350)
                                .padding(.leading, 350)
                                .foregroundColor(.gray)
                                .font(.system(size: 50))
                        }
                    }
            }
        }//: HStack
        ContextBoxView(context: LastViewContext[selecitionContext])
//        if(selecitionContext == LastViewContext.count-1){
//            NavigationLink(destination: LastView(), isActive: $isNavigationLinkActive) {
//                Button(action: {
//                    self.isNavigationLinkActive = true
//                }) {
//                   Text("Next")
//            .font(.system(size: 40))
//            .padding(.horizontal,30)
//            .padding(.vertical,20)
//            .background(Color.init(red: feelingFoodColor[user.FirstFeeling][0], green: feelingFoodColor[user.FirstFeeling][1], blue: feelingFoodColor[user.FirstFeeling][2],opacity: 0.2))
//            .cornerRadius(20)
//                }
//            }
//        }
    }
}

struct LastView_Previews: PreviewProvider {
    static var previews: some View {
        LastView()
    }
}
