//
//  CalmView.swift
//  Peeling
//
//  Created by 이가은 on 2022/04/20.
//

import SwiftUI
import AVKit

struct AngerView: View {
    
    @State var height : Double = 1.0
    @State var rate1 : Double = 0.5
    @State var rate2 : Double = 0.8
    @State var audio : AVAudioPlayer!
    @State var color : Color = Color.init(red: 234/255, green: 51/255, blue: 35/255)
    @State var textColor : Color = Color.black
    @State var isViewExplanation = false
    
    var body: some View{
        
            ZStack{
                WaveForm(height : $height,rate: $rate1, color: color.opacity(0.2), amplify: 100, isReversed: false)
                WaveForm(height : $height,rate: $rate2, color: color.opacity(0.5), amplify: 80, isReversed: false)
                WaveForm(height : $height,rate: $rate2, color: color.opacity(0.5), amplify: 130, isReversed: false)
                WaveForm(height: $height, rate: $rate1, color: color.opacity(0.2), amplify: 130, isReversed: true)
                WaveForm(height: $height, rate: $rate1, color: color.opacity(0.2), amplify: 100, isReversed: true)
                WaveForm(height: $height, rate: $rate2, color: color.opacity(0.5), amplify: 80, isReversed: true)
            }
            .background(Color.white)
            .overlay(
                VStack{
                Text("Anger")
                    .font(.system(size: 40))
                    .padding(.top,30)
                    .foregroundColor(textColor)
                Text("Drag the screen...")
                    .font(.body)
                    .padding(.top,5)
                    .opacity(isViewExplanation ? 0 : 0.8)
                    .animation(Animation.easeOut, value: isViewExplanation)
                }
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
            .accentColor(Color.black)
            .background(Color.white)
            .ignoresSafeArea(.all, edges: [.bottom,.top])
            .gesture(DragGesture()
                .onChanged({_ in
                    if(self.height < 1.3){
                        self.height += 0.002
                    }else if(self.height < 1.8){
                        self.color = Color.init(red: 220/255, green: 47/255, blue: 32/255)
                        self.height += 0.003
                    }else if(self.height < 2){
                        self.color = Color.init(red: 204/255, green: 43/255, blue: 29/255)
                        self.textColor = Color.white
                        self.height += 0.004
                    }else if(self.height < 2.2){
                        self.color = Color.init(red: 191/255, green: 39/255, blue: 27/255)
                        self.height += 0.008
                    }else if(self.height < 2.5){
                        self.color = Color.init(red: 175/255, green: 36/255, blue: 24/255)
                        self.height += 0.012
                    }else if(self.height < 4){
                        self.height += 0.015
                    }else if(self.height < 4.5){
                        self.height += 0.02
                    }else if(self.height < 5){
                        self.height += 0.1
                    }else if(self.height < 6){
                        self.height += 0.13
                    }else if(self.height < 6.5){
                        self.height += 0.14
                    }else if(self.height < 6.75){
                        self.height += 0.15
                    }else if(self.height < 7.5){
                        self.height += 0.2
                    }else if(self.height < 9){
                        self.height += 0.3
                    }else if(self.height < 100){
                        self.height += 0.5
                    }else{
                        self.textColor = Color.black
                        self.height = 1.0
                    }
                })
            )
            .onAppear{
                let song = NSDataAsset (name: "AngryMusic")
                self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "mp3")
                self.audio.play()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    self.isViewExplanation = true
                }
            }
    }
}

struct AngerView_Previews: PreviewProvider {
    static var previews: some View {
        AngerView()
        //.preferredColorScheme(.dark)
    }
}
