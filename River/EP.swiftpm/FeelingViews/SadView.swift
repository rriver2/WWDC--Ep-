//
//  SadView.swift
//  EP
//
//  Created by 이가은 on 2022/04/20.
//

import SwiftUI
import PencilKit
import AVFoundation

struct SadView : View {
    
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var color : Color = .white
    @State var type : PKInkingTool.InkType = .pen
    @State var isViewExplanation = true
    @State var audio : AVAudioPlayer!
    
    var body: some View{
        VStack{
            ZStack{
                SadDrawingView(canvas: $canvas, isDraw: $isDraw, type: $type, color: $color)
                VStack{
                    // 색 변경
                    ColorPicker("", selection: $color)
                        .onChange(of: color) { newValue in
                            isDraw = true
                        }
                        .padding(.trailing, 5)
                        .padding(.bottom, 5)
                    
                    HStack{
                        Spacer()
                        // 펜
                        Button(action: {
                            isDraw = true
                            type = .pen
                        }){
                            Image(systemName: "scribble")
                                .font(.system(size: 40))
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding(.bottom, 5)
                    // 하이라이터
                    HStack{
                        Spacer()
                        Button(action: {
                            isDraw = true
                            type = .marker
                        }){
                            Image(systemName: "scribble.variable")
                                .font(.system(size: 40))
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding(.bottom, 10)
                    // 지우개
                    HStack{
                        Spacer()
                        Button(action:{
                            isDraw = false
                        }, label: {
                            Image(systemName: "rectangle.portrait")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(Color.white)
                                .overlay(
                                    Image(systemName: "rectangle.roundedtop.fill")
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(Color.white)
                                        .padding(.bottom, 30)
                                )
                        })
                    }
                    .padding(.bottom, 5)
                    Spacer()
                }
                .padding(.top, 100)
                
            }
            .background(Color.black)
            .overlay(
                VStack{
                    Text("Sad")
                        .font(.custom("AvenirNextCondensed-Regular", size: 40))
                        .opacity(isViewExplanation ? 1.0 : 0.2)
                        .animation(Animation.easeOut, value: isViewExplanation)
                    Text("Draw Any thing...")
                        .font(.body)
                        .padding(.top,5)
                        .opacity(isViewExplanation ? 0.8 : 0)
                        .animation(Animation.easeOut, value: isViewExplanation)
                }
                    .foregroundColor(Color.white)
            )
            .ignoresSafeArea(.all, edges: [.bottom,.top])
        }.onAppear{
            let song = NSDataAsset (name: "sadMusic")
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

struct SadDrawingView : UIViewRepresentable{
    
    //앨범에 그린거 캡쳐해서 저장하기 위함
    @Binding var canvas : PKCanvasView
    @Binding var isDraw : Bool
    @Binding var type : PKInkingTool.InkType
    @Binding var color : Color
    
    //ink type 업데이트
    var ink : PKInkingTool{
        PKInkingTool(type,color: UIColor(color))
    }
    
    let eraser = PKEraserTool(.bitmap)
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        canvas.tool = isDraw ? ink : eraser
        canvas.backgroundColor = UIColor(.black)
        
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // 기본 보기가 업데이트될 때마다 도구 업데이트
        uiView.tool = isDraw ? ink : eraser
    }
}
