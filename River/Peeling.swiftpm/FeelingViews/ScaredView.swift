//
//  ​ScaredView.swift
//  Peeling
//
//  Created by 이가은 on 2022/04/22.
//

import SwiftUI
import AVFoundation

struct ​ScaredView : View{
    @State var audio : AVAudioPlayer!
    @State var isViewExplanation : Bool = true
    
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    
    var body: some View{
        ZStack{
            Image("scaredBackground")
                .resizable()
            ZStack {
                Rectangle()
                Circle()
                    .frame(width: 200, height: 200)
                    .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                    .gesture(DragGesture()
                        .onChanged { value in
                            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                        }
                        .onEnded { value in
                            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                            self.newPosition = self.currentPosition
                        })
                    .blendMode(.destinationOut)
                Text("Scared")
                    .font(.custom("AvenirNextCondensed-Regular", size: 40))
                    .opacity(isViewExplanation ? 0.7 : 0 )
                    .animation(Animation.easeOut, value: isViewExplanation)
            }
            .compositingGroup()
        }
        .ignoresSafeArea(.all, edges: [.bottom,.top])
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.isViewExplanation = false
            }
            let song = NSDataAsset (name: "scaredMusic")
            self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "mp3")
            self.audio.play()
        }
        .onDisappear {
            self.audio.stop()
        }
    }
}

struct ScaredView_Previews: PreviewProvider {
    static var previews: some View {
        ​ScaredView()
    }
}
