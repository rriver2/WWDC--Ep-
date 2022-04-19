//
//  SwiftUIView.swift
//  
//
//  Created by 이가은 on 2022/04/19.
//

import SwiftUI

struct LastView: View {

    @State var selecitionContext = 0
    
    @State var isNavigationLinkActive = false
    
    var cheerUpContext : [String]
    
    var body: some View {
        VStack{
            Button( action: {
                if(selecitionContext < cheerUpContext.count-1){
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
        ContextBoxView(context: cheerUpContext[selecitionContext])
    }
}

//struct LastView_Previews: PreviewProvider {
//    static var previews: some View {
//        LastView()
//    }
//}
