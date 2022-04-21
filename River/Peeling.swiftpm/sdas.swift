import SwiftUI


let FeelingCard = [
    "Anger", "Sadness", "Fear",   "Confused",   "Happiness",   "Bordom", "Calm"
]

let FeelingCardColor = [
    "Anger" : Color.red,"Sadness" : Color.indigo , "Fear" : Color.brown , "Confused" : Color.purple , "Happiness" : Color.yellow , "Bordom" : Color.black , "Calm" : Color.green
]

struct NextView: View {
    let openViewName: String
    
    @ViewBuilder var body: some View {
        switch openViewName{
        case "Anger" :
            HappinessView() //
        case "Sadness" :
            SadnessView()
        case "Fear" :
            HappinessView() //
        case "Confused" :
            HappinessView() //
        case "Happiness" :
            HappinessView()
        case "Bordom" :
            BordomView()
        case "Calm" :
            CalmView()
        default:
            BordomView()
        }
    }
}


struct SelectFeeling2: View {
    @State var offset : CGSize = CGSize()
    @State var rotation3DEffectZ : Double = 1.0
    
    @State var isNavigationActive = false
    
    @State var openViewName : String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal, showsIndicators : false){
                    HStack{
                        ForEach(FeelingCard.indices, id: \.self){ index in
                            GeometryReader { geomitry in
                                
                                Rectangle()
                                    .fill(FeelingCardColor[FeelingCard[index]]!)
                                    .cornerRadius(22)
                                    .opacity(0.2)
                                    .overlay(
                                        Button(action: {
                                            self.isNavigationActive = true
                                            print(isNavigationActive)
                                            openViewName = FeelingCard[index]
                                        }){
                                            Text(FeelingCard[index])
                                                .font(.title)
                                                .foregroundColor(.black)
                                                .frame(width: 300.0, height: 500.0)
                                        }
                                    )
                                    .offset(x: 0, y: geomitry.size.height / 2.5 )
                                    .rotation3DEffect(.degrees(                                Double(geomitry.frame(in: .global).minX / -20)
                                                              ), axis: (x: 0.0, y: 0.0, z: 2.0))
                                
                                    .frame(width: 300.0, height: 500.0)
                                
                            }
                            .frame(width: 250.0, height: UIScreen.main.bounds.height)
                        }
                    }
                    .padding(.leading, 200)
                    .padding(.trailing, 500)
                }
                
                NavigationLink(destination: NextView(openViewName : openViewName), isActive: $isNavigationActive) {
                    
                }            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SelectFeeling2_Previews: PreviewProvider {
    static var previews: some View {
        SelectFeeling2()
    }
}

