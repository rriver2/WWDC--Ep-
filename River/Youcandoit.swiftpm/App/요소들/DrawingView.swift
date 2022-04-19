//
//  SwiftUIView.swift
//  
//
//  Created by 이가은 on 2022/04/19.
//
//
import SwiftUI
import PencilKit

struct DrawingHomeView : View {
    
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var color : Color = .black
    @State var type : PKInkingTool.InkType = .pen
    @State var colorPicker = false
    
    var body: some View{
        HStack{
            DrawingView(canvas: $canvas, isDraw: $isDraw, type: $type, color: $color)
            VStack{
                // 지우개
            Button(action:{
                isDraw = false
            }, label: {
                Image(systemName: "trash")
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
            })
                // 색 변경
                Button(action: {
                    colorPicker.toggle()
                }){
                        Text("🎨")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                }
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
                
                //                        SaveImage()
                
            }
                
        }
        .sheet(isPresented: $colorPicker){
            ColorPicker("Pick Color", selection: $color)
                .padding()
        }
        .padding(5)
        .background(Color.black)
        .padding()
    }
    
    //    func SaveImage(){
    //        // canvas에서 이미지 가져오기
    //        let image = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1)
    //
    //        // 앨범에 저장
    //        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    // info.plist
    //    }
}

struct DrawingView : UIViewRepresentable{
    
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
        
        return canvas
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
        // 기본 보기가 업데이트될 때마다 도구 업데이트
        
        uiView.tool = isDraw ? ink : eraser
    }
}
