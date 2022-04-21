//
//  HappinessView.swift
//  Peeling
//
//  Created by 이가은 on 2022/04/20.
//
import SwiftUI
import AVKit

struct HappinessView: View {
    @State var scale : CGFloat = 0.5
    @State var offset : CGSize = CGSize(width: .random(in: 20...100), height: .random(in: 20...100))
    
    var body: some View {
        
        ZStack {
            ForEach (1...50, id:\.self) { _ in
                Circle ()
                    .foregroundColor(Color (red: .random(in: 0.3...1), green: .random(in: 0.3...1), blue: .random(in: 0.3...1)))
                    .opacity(0.3)
                    .animation (Animation.spring (dampingFraction: 0.3)
                        .repeatForever()
                        .speed (.random(in: 0.1...0.4))
                        .delay(.random (in: 0...0.5)), value: scale
                    )
                    .scaleEffect(self.scale * .random(in: 1...3))
                    .frame(width: .random(in: 1...100),
                           height: CGFloat.random (in:20...100),
                           alignment: .center)
                    .position(CGPoint(x: .random(in: 0...UIScreen.main.bounds.width),y: .random (in:0...UIScreen.main.bounds.height)))
                    .offset(x: offset.width, y: offset.height)
                    .gesture(DragGesture()
                        .onChanged { value in
                            self.offset = value.translation
                        })
            }
        }
        .onAppear {
            self.scale = 1.5
        }
        .background(Color.white)
        .overlay(
            Text("Happiness")
                .font(.title)
        )
        .ignoresSafeArea(.all, edges: [.bottom,.top])
    }
}

struct HappinessView_Previews: PreviewProvider {
    static var previews: some View {
        HappinessView()
    }
}
