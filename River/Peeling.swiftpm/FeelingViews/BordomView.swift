//
//  BordomView.swift
//  Peeling
//
//  Created by 이가은 on 2022/04/20.
//

import SwiftUI
import AVKit

struct BordomView: View {
    
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var audio : AVAudioPlayer!
    
    @State var astronautPosition : CGSize = CGSize(width: .random(in: 500...1300),height: .random (in: 500...1300))
    
    @State var rotation : Double = 0.0
    
    @State var movingInfinity : Bool = false
    
    @State var duration : Double = 30.0
    
    func gerTime(currentDate : Date)->String{
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy'-'MM'-'dd' 'HH':'mm':'ss'"
        return formatter.string(from: currentDate)
    }
    
    var body: some View {
        
        ZStack{
            VStack{}
                .overlay(
                    Image("space")
                        .resizable()
                        .rotationEffect(.degrees(rotation))
                        .frame(width: UIScreen.main.bounds.height * 1.5, height: UIScreen.main.bounds.height * 1.5)
                        .mask(
                            Rectangle().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        )
                )
            
            Image("astronaut")
                .resizable()
                .frame(width: 250, height: 250)
                .opacity(0.5)
                .position(CGPoint(x: self.astronautPosition.width ,y:  self.astronautPosition.height))
                .onReceive(timer){ input in
                    withAnimation(Animation.easeInOut(duration: self.duration)
                        .repeatForever(autoreverses: true)
                    ) {
                        self.astronautPosition = CGSize(width: .random(in: 500...1300),height: .random (in: 500...1300))
                        self.rotation = .random(in: 0...100)
                    }
                }
        }
        .overlay(
            VStack{
                Text("Bordom").foregroundColor(Color.white)
                    .font(.custom("AvenirNextCondensed-Regular", size: 40))
                Text("\(gerTime(currentDate: currentDate))")
                    .onReceive(timer) { input in
                        currentDate = input
                    }
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
                    .opacity(0.8)
                    .padding(.top, 5)
            }
        )
        .onAppear{
            let song = NSDataAsset (name: "BordomMusic")
            self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "mp3")
            self.audio.play()
        }
        .ignoresSafeArea(.all, edges: [.bottom,.top])
    }
}

struct BordomView_Previews: PreviewProvider {
    static var previews: some View {
        BordomView()
        //.preferredColorScheme(.dark)
    }
}
