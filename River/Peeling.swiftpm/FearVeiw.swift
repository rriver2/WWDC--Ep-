import SwiftUI

struct FearView : View{
    
    var body: some View{
        VStack{
            
            Image("fearBackground")
                .resizable()
                .overlay(
                    Rectangle().frame(width: 10, height: 100)
                )
        }
        .ignoresSafeArea(.all, edges: [.bottom,.top])
    }
}

struct FearView_Previews: PreviewProvider {
    static var previews: some View {
        FearView()
    }
}
