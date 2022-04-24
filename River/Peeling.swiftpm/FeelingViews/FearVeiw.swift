import SwiftUI


struct FearView : View{
    
    @State var offset : CGSize = .zero
    
    @State var isViewExplanation : Bool = true
    
    var body: some View{
        ZStack{
            Image("fearBackground")
                .resizable()
            
            ZStack {
                Rectangle()
              Circle()
                .blendMode(.destinationOut)
                .frame(width: 200, height: 200)
                .offset(x: offset.width, y: offset.height)
                .overlay(
                    Text("Fear")
                    .font(.custom("AvenirNextCondensed-Regular", size: 40))
                    .opacity(isViewExplanation ? 0.7 : 0 )
                    .animation(Animation.easeOut, value: isViewExplanation)
                )
            }
            .compositingGroup()
            
        }
        .gesture(
            DragGesture()
                .onChanged({ value in
                    self.offset = value.translation
                })
        )
        .ignoresSafeArea(.all, edges: [.bottom,.top])
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.isViewExplanation = false
            }
        }
    }
}

struct FearView_Previews: PreviewProvider {
    static var previews: some View {
        FearView()
    }
}
