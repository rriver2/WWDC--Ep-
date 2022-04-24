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
