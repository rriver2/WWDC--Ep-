//
//  DrawingView.swift
//  Peeling
//
//  Created by 이가은 on 2022/04/20.
//
import SwiftUI
import PencilKit

struct SadnessView : View {
    
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var color : Color = .white
    @State var type : PKInkingTool.InkType = .pen
    @State var isViewExplanation = false
    
    var body: some View{
        VStack{
            VStack{
                HStack{
                    // 색 변경
                    ColorPicker("", selection: $color)
                        .padding(.trailing, 10.0)
                        .frame(height: 20.0)
                        .onChange(of: color) { newValue in
                            isDraw = true
                        }
                    // 지우개
                    Button(action:{
                        isDraw = false
                    }, label: {
                        Image(systemName: "trash")
                            .font(.system(size: 40))
                            .foregroundColor(Color.white)
                    })
                    // 펜
                    Button(action: {
                        isDraw = true
                        type = .pen
                    }){
                        Image(systemName: "scribble")
                            .font(.system(size: 40))
                            .foregroundColor(Color.white)
                    }
                    // 하이라이터
                    Button(action: {
                        isDraw = true
                        type = .marker
                    }){
                        Image(systemName: "scribble.variable")
                            .font(.system(size: 40))
                            .foregroundColor(Color.white)
                    }
                }
                SadnessDrawingView(canvas: $canvas, isDraw: $isDraw, type: $type, color: $color)
            }
            .background(Color.black)
            .overlay(
                VStack{
                    Text("Sadness ")
                        .font(.title)
                        .opacity(isViewExplanation ? 0.2 : 1.0)
                        .animation(Animation.easeOut, value: isViewExplanation)
                    Text("Draw Any thing...")
                        .font(.body)
                        .padding(.top,5)
                        .opacity(isViewExplanation ? 0 : 0.8)
                        .animation(Animation.easeOut, value: isViewExplanation)
                }
                    .foregroundColor(Color.white)
            )
            .ignoresSafeArea(.all, edges: [.bottom,.top])
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.isViewExplanation = true
            }
        }
    }
}

struct SadnessDrawingView : UIViewRepresentable{
    
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
