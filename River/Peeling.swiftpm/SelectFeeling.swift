import SwiftUI

struct SelectFeeling: View {
    @State var offset : CGSize = CGSize()
    @State var rotation3DEffectZ : Double = 1.0
    
    var body: some View {
            HStack{
                VStack {
                    Text("Happiness")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .frame(width: 300.0, height: 500.0)
                .background(Color.yellow)
                .cornerRadius(22)
                .foregroundColor(.orange)
                .offset(x: -80, y: 60)
                .rotation3DEffect(.degrees(10), axis: (x: 0.0, y: 0.0, z: -1.0))
                
                VStack {
                    Text("Happiness")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .frame(width: 300.0, height: 500.0)
                .background(Color.yellow)
                .cornerRadius(22)
                .offset(x: -40, y: 20)
                .rotation3DEffect(.degrees(6), axis: (x: 0.0, y: 0.0, z: -1.0))
                
                VStack {
                    Text("Happiness")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .frame(width: 300.0, height: 500.0)
                .background(Color.yellow)
                .cornerRadius(22)
                .foregroundColor(.orange)
                
                VStack {
                    Text("Happiness")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .frame(width: 300.0, height: 500.0)
                .background(Color.yellow)
                .cornerRadius(22)
                .foregroundColor(.orange)
                .offset(x: 40, y: 20)
                .rotation3DEffect(.degrees(6), axis: (x: 0.0, y: 0.0, z: 1.0))
                
                
                    VStack {
                        Text("Happiness")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    .frame(width: 300.0, height: 500.0)
                    .background(Color.yellow)
                    .cornerRadius(22)
                    .foregroundColor(.orange)
                    .offset(x: 80, y: 60)
                    .rotation3DEffect(.degrees(10), axis: (x: 0.0, y: 0.0, z: 1.0))
            }
        //        .rotation3DEffect(.degrees(12), axis: (x: 90, y: -90, z: 0))
    }
}

struct SelectFeeling_Previews: PreviewProvider {
    static var previews: some View {
        SelectFeeling()
    }
}

