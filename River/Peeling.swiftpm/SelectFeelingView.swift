import SwiftUI


let FeelingCard = [
    "Anger","Happiness",  "Calm", "Fear", "Bordom" ,"Sadness",
]

let FeelingCardColor = [
    "Anger" : Color.init(red: 191/255, green: 39/255, blue: 27/255),
    "Sadness" : Color.init(red: 0/255, green: 0/255, blue: 0/255),
    "Happiness" : Color.init(red: 247/255, green: 196/255, blue: 75/255),
    "Bordom" : Color.init(red: 14/255, green: 12/255, blue: 48/255),
    "Calm" : Color.init(red: 78/255, green: 157/255, blue: 202/255),
    "Fear" : Color.init(red: 69/255, green: 68/255, blue: 65/255)
]

struct NextView: View {
    let openViewName: String
    
    @ViewBuilder var body: some View {
        switch openViewName{
        case "Anger" :
            AngerView()
        case "Sadness" :
            SadnessView()
        case "Fear" :
            FearView() //
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


struct SelectFeeling: View {
    @State var offset : CGSize = CGSize()
    @State var rotation3DEffectZ : Double = 1.0
    
    @State var isNavigationActive = false
    
    @State var openViewName : String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Text("뭐라 적지..")
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
                                                        .font(.title)
                                                    Spacer()
                                                }
                                                Spacer()
                                                Text(FeelingCard[index])
                                                    .font(.system(size: 40))
                                                Spacer()
                                                Spacer()
                                            }
                                            .frame(width: 300.0, height: 500.0)
                                            .foregroundColor(.white)
                                        }
                                    )
                                    .offset(x: 0, y: geomitry.size.height / 2.5 )
                                    .rotation3DEffect(.degrees(Double(geomitry.frame(in: .global).minX / -10)), axis: (x: 0.0, y: 0.0, z: 2.0))
                                    .frame(width: 300.0, height: 500.0)
                                    .shadow(radius: 20,x: 15,y:15)
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
            openViewName == "Sadness" || openViewName == "Bordom" || openViewName == "Calm" ? Color.white : Color.black
        )
    }
}

struct SelectFeeling_Previews: PreviewProvider {
    static var previews: some View {
        SelectFeeling()
    }
}

