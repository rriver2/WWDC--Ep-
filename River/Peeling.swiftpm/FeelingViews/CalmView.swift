//
//  CalmView.swift
//  Peeling
//
//  Created by 이가은 on 2022/04/20.
//

import SwiftUI
import AVFoundation

struct CalmView: View {
    
    @State var shapeCalm : String = "Circle"
    
    @State var rate1 : Double = 8.0
    @State var rate2 : Double = 7.0
    @State var audio : AVAudioPlayer!
    @State var isViewExplanation = true
    
    let shapes = ["Circle", "RoundedRectangle", "Triangle", "Rectangle"]
    
    var colors : [Double] = [102/255, 153/255, 200/255]
    
    @State var height : Double = 3.0
    
    var body: some View{
        ZStack{
            WaveForm(height: $height, rate: $rate1, color: Color.init(red: colors[0], green: colors[1], blue: colors[2]).opacity(0.5), amplify: 80, isReversed: false)
            WaveForm(height: $height, rate: $rate2, color: Color.init(red: colors[0], green: colors[1], blue: colors[2]).opacity(0.2), amplify: 80, isReversed: false)
            WaveForm(height: $height, rate: $rate1, color: Color.init(red: colors[0], green: colors[1], blue: colors[2]).opacity(0.5), amplify: 80, isReversed: true)
            WaveForm(height: $height, rate: $rate2, color: Color.init(red: colors[0], green: colors[1], blue: colors[2]).opacity(0.5), amplify: 80, isReversed: true)
        }
        .frame(width: 500, height: 500)
        .background(Color.white)
        .mask(
                ShapWave(name: shapeCalm).rotationEffect(.degrees(180))
        )
        .animation(Animation.easeIn(duration: 3), value: shapeCalm)
        .overlay(
            
            Button {
                var index = shapes.firstIndex(of: shapeCalm)!
                if(index >= shapes.count-1){
                    index = 0
                }else{
                    index += 1
                }
                shapeCalm = shapes[index]
            } label: {
                VStack{
                    Text("Calm")
                        .font(.custom("AvenirNextCondensed-Regular", size: 40))
                        .padding(.top,30)
                        .padding(.bottom, 2)
                        .foregroundColor(Color.white)
                    Text("Click me")
                        .font(.body)
                        .opacity(isViewExplanation ? 0.7 : 0)
                        .animation(Animation.easeOut, value: isViewExplanation)
                        .foregroundColor(Color.white)
                }.frame(width: 500, height: 500)
            }
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
        .accentColor(Color.black)
        .background(Color.init(red: 78/255, green: 157/255, blue: 202/255))
        .ignoresSafeArea(.all, edges: [.bottom,.top])
        .onAppear {
            let song = NSDataAsset (name: "ssasd")
            self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "mp3")
            self.audio.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.isViewExplanation = false
            }
        }
        .onDisappear {
            self.audio.stop()
        }
    }
}

struct CalmView_Previews: PreviewProvider {
    static var previews: some View {
        CalmView()
        //.preferredColorScheme(.dark)
    }
}

struct ShapWave: View {
    let name: String
    
    @ViewBuilder var body: some View {
        switch name{
        case "Rectangle" :
            Rectangle()
        case "Circle" :
            Circle()
        case "RoundedRectangle" :
            RoundedRectangle(cornerRadius: 20)
        case "Triangle" :
            Triangle()
        default:
            Circle()
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minX))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        return path
    }
}

struct WaveForm: View{
    // 색
    @Binding var height : Double
    
    @Binding var rate : Double
    
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
                let angle = timeNow.remainder(dividingBy: rate)
                
                //offset 계산 -> 이동 시간 거리 계산
                let offset = angle * size.width * 1/rate
                //                context.draw(Text("\(offset)"), at: CGPoint(x: size.width / 2, y: 100))
                
                // 뷰 전체 움직이기
                context.translateBy(x: isReversed ? -offset: offset, y: 0)
                
                //SwiftUI path
                context.fill(getPath(size: size, height : height), with: .color(color))
                
                // 두개 엇 갈려 보이게
                context.translateBy(x: -size.width, y: 0)
                context.fill(getPath(size: size, height : height), with: .color(color))
                
                context.translateBy(x: size.width * 2, y: 0)
                context.fill(getPath(size: size, height : height), with: .color(color))
            }
        }
    }
    
    func getPath(size:CGSize, height : Double)->Path{
        
        return (Path{path in
            
            let midHeight = size.height / height
            
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
