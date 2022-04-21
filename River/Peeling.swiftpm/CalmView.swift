//
//  CalmView.swift
//  Peeling
//
//  Created by 이가은 on 2022/04/20.
//

import SwiftUI

struct CalmView: View {
    
    var body: some View{
        
        ZStack{
            WaveForm(color: Color.init(red: 171/255, green: 205/255, blue: 225/255).opacity(0.8), amplify: 100, isReversed: false)
            WaveForm(color: Color.init(red: 171/255, green: 205/255, blue: 225/255).opacity(0.6), amplify: 100, isReversed: true)
        }
        .frame(width: 500, height: 500)
        .background(Color.white)
        .mask(Circle())
        .overlay(
            Text("Calm")
                .font(.title)
                .padding(.top,30)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
        .accentColor(Color.black)
        .background(Color.init(red: 78/255, green: 157/255, blue: 202/255))
        .ignoresSafeArea(.all, edges: [.bottom,.top])
    }
}

struct CalmView_Previews: PreviewProvider {
    static var previews: some View {
        CalmView()
        //.preferredColorScheme(.dark)
    }
}

struct WaveForm: View{
    // 색
    var color : Color
    var amplify : CGFloat
    var isReversed : Bool
    
    var body: some View{
        //시각 불러오기
        TimelineView(.animation){ timeline in
            // wave 그리기
            Canvas{context, size in
                let timeNow = timeline.date.timeIntervalSinceReferenceDate
                
                // 시간에 따라 흐르게 하기
                let angle = timeNow.remainder(dividingBy: 5)
                
                //offset 계산 -> 이동 시간 거리 계산
                let offset = angle * size.width * 1/5
                //                context.draw(Text("\(offset)"), at: CGPoint(x: size.width / 2, y: 100))
                
                // 뷰 전체 움직이기
                context.translateBy(x: isReversed ? -offset: offset, y: 0)
                
                //SwiftUI path
                context.fill(getPath(size: size), with: .color(color))
                
                // 두개 엇 갈려 보이게
                context.translateBy(x: -size.width, y: 0)
                context.fill(getPath(size: size), with: .color(color))
                
                context.translateBy(x: size.width * 2, y: 0)
                context.fill(getPath(size: size), with: .color(color))
            }
            
        }
    }
    
    func getPath(size:CGSize)->Path{
        return (Path{path in
            
            let midHeight = size.height / 3
            
            let width = size.width
            
            // wave 움직이기
            path.move(to: CGPoint(x: 0, y: midHeight))
            
            // carve 그리기
            
            // 아래 녀석
            path.addCurve(to: CGPoint(x: width, y: midHeight),
                          control1: CGPoint(x: width * 0.4, y: midHeight + amplify), // 왼쪽 볼록이
                          control2: CGPoint(x: width * 0.65, y: midHeight - amplify) // 오른쪽 볼록이
            )
            
            // 아래 남은 여백 채우기
            path.addLine(to: CGPoint(x:width, y: size.height))
            path.addLine(to: CGPoint(x:0, y: size.height))
        })
    }
}
