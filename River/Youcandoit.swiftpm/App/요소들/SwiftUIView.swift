//
//  SwiftUIView.swift
//  
//
//  Created by 이가은 on 2022/04/19.
//

import SwiftUI

struct ContextBoxView: View {
    var context : String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            VStack {
                Text(context)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 40))
                    .padding(20)
                    .background(Color.white)
                
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(20)
        }
        .padding(5)
        .background(Color.black)
        .cornerRadius(20)
        .padding(20)
    }
}

//struct ContextBoxView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContextBoxView()
//    }
//}
