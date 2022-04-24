import SwiftUI

struct ContentView: View {
        @State var offset : CGSize = CGSize()
    @State var rotation3DEffectZ : Double = 1.0
    
    @State var isNavigationActive = false
    
    @State var openViewName : String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("paperBackground")
                    .resizable()
                    .ignoresSafeArea(.all, edges: [.bottom,.top])
                    .opacity(0.4)
                ScrollView(.horizontal, showsIndicators : false){
                    HStack{
                        ForEach(FeelingCard.indices, id: \.self){ index in
                            GeometryReader { geomitry in
                                Rectangle()
                                    .fill(FeelingCardColor[FeelingCard[index]]!)
                                    .cornerRadius(22)
                                    .overlay(
                                        Button(action: {
                                            self.isNavigationActive = true
                                            print(isNavigationActive)
                                            openViewName = FeelingCard[index]
                                        }){
                                            VStack{
                                                HStack{
                                                    Text("\(index+1)")
                                                        .padding(.leading, 30)
                                                        .padding(.top, 30)
                                                        .font(.custom("AvenirNextCondensed-Regular", size: 30))
                                                    Spacer()
                                                }
                                                Spacer()
                                                Text(FeelingCard[index])
                                                    .font(.custom("AvenirNextCondensed-Regular", size: 50))
                                                Spacer()
                                                Spacer()
                                            }
                                            .frame(width: UIScreen.main.bounds.width/3, height: (UIScreen.main.bounds.width/3)*1.5)
                                            .foregroundColor(.white)
                                        }
                                    )
                                    .offset(x: 0, y: geomitry.size.height / 2.5 )
                                    .rotation3DEffect(.degrees(Double(geomitry.frame(in: .global).minX / -10)), axis: (x: 0.0, y: 0.0, z: 2.0))
                                    .frame(width: UIScreen.main.bounds.width/3, height: (UIScreen.main.bounds.width/3)*1.5)
                                    .shadow(color: FeelingCardColor[FeelingCard[index]]!.opacity(0.7), radius: 20,x: 15,y:15)
                            }
                            .frame(width: 250.0, height: UIScreen.main.bounds.height)
                        }
                    }
                    .padding(.leading, 120)
                    .padding(.trailing, 550)
                }
                
                NavigationLink(destination: NextView(openViewName : openViewName), isActive: $isNavigationActive) {
                }}
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(
            openViewName == "Sad" || openViewName == "Bored" || openViewName == "Calm" || openViewName == "Scared" ? Color.white : Color.black
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

