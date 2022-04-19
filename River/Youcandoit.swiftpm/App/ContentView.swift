//
//  ContentView.swift
//  WWDC
//
//  Created by 이가은 on 2022/04/16.
//

import SwiftUI

class User : ObservableObject {
    @Published var name : String = ""
    @Published var FirstFeeling : Int = 0 // "Anger"
    @Published var FirstFeelingOpacity : Double = 5.0
    @Published var FirstFeelingfeelingDetailSelectedDic :  [String: Int] = [:] // "upset":3,"furious":6
}

struct ContentView: View {
    @ObservedObject var user : User = User()
    
    @State var selecitionContext = 0
    @State private var isShowRecordView = false
    @State private var username: String = ""
    
    let MainViewContext : [String] = [
        "What is your name?",
        "hi, ",
        "I'm the heart in you.",
        "These days, I am losing my color due to the lack of emotions in my town.",
        "I want you to help me!",
        "The more you answer honestly, the more colorful the color becomes 😚",
        "Thank you, "
    ]
    
    var body: some View {
        
        NavigationView{
            VStack{
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut) {
                        if(selecitionContext < MainViewContext.count-1 && username != ""){
                            selecitionContext += 1
                        }
                    }
                }){
                    if(selecitionContext >= MainViewContext.count-1){
                        Button( action: {
                            self.isShowRecordView = true
                            if(selecitionContext == 1){
                                self.user.name = username
                            }
                        }){
                            HeartImageView(selecitionContext: $selecitionContext, username: $username)
                        }
                        NavigationLink( "RecordView", destination: RecordView(user: user), isActive: $isShowRecordView)
                            .hidden()
                    }
                    else{
                        HeartImageView(selecitionContext: $selecitionContext, username: $username)
                    }
                } // : Button
                VStack(alignment: .leading, spacing: 30){
                    VStack {
                        if(selecitionContext == 1 || selecitionContext == 6 ){
                            Text("\(MainViewContext[selecitionContext]) \(username) !")
                                .frame(maxWidth: .infinity)
                                .font(.system(size: 40))
                                .padding(20)
                                .background(Color.white)
                        }else{
                            Text(MainViewContext[selecitionContext])
                                .frame(maxWidth: .infinity)
                                .font(.system(size: 40))
                                .padding(20)
                                .background(Color.white)
                        }
                        
                        if(selecitionContext == 0 ){
                            HStack{
                                Text("name : ")
                                    .font(.system(size: 30))
                                TextField(
                                    "",
                                    text: $username
                                )
                                .font(.system(size: 30))
                                .frame(width: 200, height: 100, alignment: .center)
                            }
                            .padding(.horizontal,20)
                            .background(Color.white)
                            .padding(.bottom,5)
                            .background(Color.gray)
                        }
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(20)
                }
                .padding(5)
                .background(Color.black)
                .cornerRadius(20)
                .padding(20)
                
                Spacer()
                
            }// : NavigationView VStack
        } // : NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HeartImageView : View{
    
    @Binding var selecitionContext : Int
    @Binding var username : String
    
    var body : some View{
        Image("story\(selecitionContext+1)")
            .resizable()
            .frame(width: 500, height:500)
            .overlay{
                if(selecitionContext == 0 && username != ""){
                    Image(systemName: "hand.tap")
                        .padding(.bottom, 300)
                        .padding(.leading, 250)
                        .foregroundColor(.gray)
                        .font(.system(size: 50))
                }
            }
            .padding(.bottom,20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
