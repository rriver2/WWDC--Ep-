import SwiftUI

let FeelingCard = [
    "Happy", "Scared", "Calm", "Bored" , "Angry", "Sad"
]

let FeelingCardColor = [
    "Angry" : Color.init(red: 191/255, green: 39/255, blue: 27/255),
    "Sad" : Color.init(red: 0/255, green: 0/255, blue: 0/255),
    "Happy" : Color.init(red: 247/255, green: 196/255, blue: 75/255),
    "Bored" : Color.init(red: 14/255, green: 12/255, blue: 48/255),
    "Calm" : Color.init(red: 78/255, green: 157/255, blue: 202/255),
    "Scared" : Color.init(red: 69/255, green: 68/255, blue: 65/255)
]

struct NextView: View {
    let openViewName: String
    
    @ViewBuilder var body: some View {
        switch openViewName{
        case "Angry" :
            AngryView()
        case "Sad" :
            SadView()
        case "Scared" :
            ​ScaredView()
        case "Happy" :
            HappyView()
        case "Bored" :
            BoredView()
        case "Calm" :
            CalmView()
        default:
            BoredView()
        }
    }
}
