//
//  BordomView.swift
//  Peeling
//
//  Created by 이가은 on 2022/04/20.
//

import SwiftUI


struct BordomView: View {
    
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var astronautPosition : CGSize = CGSize(width: .random(in: 500...1500),height: .random (in: 500...1500))
    
    @State var rotation : Double = 0.0
    
    @State var movingInfinity : Bool = false
    
    @State var duration : Double = 30.0
    
    var body: some View {
        
        ZStack{
            Image("space")
                .resizable()
                .rotationEffect(.degrees(rotation))
                .frame(width: UIScreen.main.bounds.height * 1.5, height: UIScreen.main.bounds.height * 1.5)
            
            Image("astronaut")
                .resizable()
                .frame(width: 250, height: 250)
                .opacity(0.3)
                .position(CGPoint(x: self.astronautPosition.width ,y:  self.astronautPosition.height))
                .onReceive(timer){ input in
                    withAnimation(Animation.easeInOut(duration: self.duration)
                        .repeatForever(autoreverses: true)
                    ) {
                        self.astronautPosition = CGSize(width: .random(in: 500...1500),height: .random (in: 500...1500))
                        self.rotation = .random(in: 0...100)
                    }
                }        }
        .overlay(
            VStack{
                Text("Bordom").foregroundColor(Color.white)
                    .font(.title)
                Text("\(currentDate)")
                    .onReceive(timer) { input in
                        currentDate = input
                    }
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .opacity(0.8)
                    .padding(.top,10)
            }
        )
        .ignoresSafeArea(.all, edges: [.bottom,.top])
    }
}

struct BordomView_Previews: PreviewProvider {
    static var previews: some View {
        BordomView()
        //.preferredColorScheme(.dark)
    }
}
