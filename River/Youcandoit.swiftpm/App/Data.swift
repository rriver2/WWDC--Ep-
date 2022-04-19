/*
See the License.txt file for this sample’s licensing information.
*/

import Foundation
import SwiftUI

var feelingFood = ["Happiness", "Energized", "Comfort", "Boredom", "Depression / Sad", "Anger", "Anxiety /     Fear", "Confusion"]

var feelingDetail : [String:[String]] = [
    "Anger" : [
        "upset", "bothersome", "furious", "frustrated", "anxious", "awkward", "irritated", "uncomfortable", "raging", "nervous", "chaotic", "stress"
    ]
]

var feelingDetailDictionary : [String:String] = [
    // Anger
    "upset" : "to make someone worried, unhappy, or angry",
    "bothersome" : "annoying or causing trouble",
    "furious" : "extremely angry",
    "frustrated" : "feeling annoyed or less confident because you cannot achieve what you want",
    "anxious" : "worried and nervous",
    "awkward" : "difficult to use, do, or deal with",
    "irritated" : "annoyed",
    "uncomfortable" : "not feeling comfortable and pleasant",
    "raging" : "very strong or violent",
    "nervous" : "worried and anxious",
    "chaotic" : "in a state of total confusion with no order",
    "stress" : "great worry caused by a difficult situation, or something that causes this condition"
]

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
