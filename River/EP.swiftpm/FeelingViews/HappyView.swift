//
//  HappyView.swift
//  EP
//
//  Created by 이가은 on 2022/04/20.
//
import SwiftUI
import AVFoundation

struct HappyView: View {
    @State var scale : CGFloat = 0.5
    @State var audio : AVAudioPlayer!
    
    var body: some View {
        
        ZStack {
            ForEach (1...50, id:\.self) { _ in
                Circle ()
                    .foregroundColor(Color (red: .random(in: 0.3...1), green: .random(in: 0.3...1), blue: .random(in: 0.3...1)))
                    .opacity(0.3)
                    .animation (Animation.spring (dampingFraction: 0.3)
                        .repeatForever()
                        .speed (.random(in: 0.5...1.0))
                        .delay(.random (in: 0...1)), value: scale
                    )
                    .scaleEffect(self.scale * .random(in: 1...3))
                    .frame(width: .random(in: 1...100),
                           height: CGFloat.random (in:20...100),
                           alignment: .center)
                    .position(CGPoint(x: .random(in: 0...UIScreen.main.bounds.width),y: .random (in:0...UIScreen.main.bounds.height)))
            }
        }
        .onAppear {
            self.scale = 1.5
                    let song = NSDataAsset (name: "happyMusic")
                    self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "mp3")
                    self.audio.play()
        }
        .onDisappear {
            self.audio.stop()
        }
        .background(Color.white)
        .overlay(
            Text("Happy")
                .font(.custom("AvenirNextCondensed-Regular", size: 40))
        )
        .ignoresSafeArea(.all, edges: [.bottom,.top])
    }
}

struct HappyView_Previews: PreviewProvider {
    static var previews: some View {
        HappyView()
    }
}
