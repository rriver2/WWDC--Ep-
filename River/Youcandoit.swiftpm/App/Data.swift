/*
See the License.txt file for this sample’s licensing information.
*/

import Foundation
import SwiftUI

var feelingFood = ["Happiness", "Energized", "Comfort", "Boredom", "Depression / Sad", "Anger", "Anxiety / heFear", "Confusion"]

var feelingFoodColor : [[Double]] = [
    [249/255, 217/255, 85/255],
    [226/255, 149/255, 76/255],
    [142/255, 163/255, 141/255],
    [129/255, 129/255, 129/255],
    [102/255, 153/255, 200/255],
    [193/255, 43/255, 31/255],
    [76/255, 88/255, 81/255],
    [159/255, 95/255, 161/255],
]


struct FeelingDetail {
    var name : String
    var meaning : String
    var count : Int
}

var Feelings : [String :[FeelingDetail]] = [
    "Anger" : [
    FeelingDetail(name: "upset", meaning: "to make someone worried, unhappy, or angry", count: 0),
    FeelingDetail(name: "bothersome", meaning: "annoying or causing trouble", count: 0),
    FeelingDetail(name: "furious", meaning: "extremely angry", count: 0),
    FeelingDetail(name: "frustrated", meaning: "feeling annoyed or less confident because you cannot achieve what you want", count: 0),
    FeelingDetail(name: "anxious", meaning: "worried and nervous", count: 0),
    FeelingDetail(name: "awkward", meaning: "difficult to use, do, or deal with", count: 0),
    FeelingDetail(name: "irritated", meaning: "annoyed", count: 0),
    FeelingDetail(name: "uncomfortable", meaning: "not feeling comfortable and pleasant", count: 0),
    FeelingDetail(name: "raging", meaning: "very strong or violent", count: 0),
    FeelingDetail(name: "nervous", meaning: "worried and anxious", count: 0),
    FeelingDetail(name: "chaotic", meaning: "in a state of total confusion with no order", count: 0),
    FeelingDetail(name: "stress", meaning: "great worry caused by a difficult situation, or something that causes this condition", count: 0)
    ]
]// Feelings[Anger][]

