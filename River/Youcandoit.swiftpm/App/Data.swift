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
    
    init(_ name : String, _ meaning : String){
        self.name = name
        self.meaning = meaning
        self.count = 0
    }
}

var Feelings : [String :[FeelingDetail]] = [
    "Happiness" : [
        FeelingDetail("glad", "happy and pleased about something"),
        FeelingDetail("warm-hearted", "friendly, kind, and generous"),
        FeelingDetail("peaceful", "not involving war or violence"),
        FeelingDetail("magnificent", "very impressive and beautiful, good, or skilful"),
        FeelingDetail("relaxed", "calm and not worried"),
        FeelingDetail("appreciate", "to be grateful for something"),
        FeelingDetail("happy", "feeling pleased and satisfied"),
        FeelingDetail("calm", "not affected by strong emotions such as excitement, anger, shock, or fear"),
        FeelingDetail("wonderful", "extremely good"),
        FeelingDetail("be full", "to get a lot of enjoyment from the things that you do"),
        FeelingDetail("excited", "very happy and enthusiastic because something good is going to happen, especially when this makes you unable to relax"),
        FeelingDetail("delighted", "very happy, especially because something good has happened"),
        FeelingDetail("proud", "feeling happy about your achievements, your possessions, or people who you are connected with"),
        FeelingDetail("satisfactory", "good enough to be accepted in a particular situation"),
        FeelingDetail("comfortable", "feeling physically relaxed, without any pain or other unpleasant feelings"),
        FeelingDetail("energized", "simple past tense and past participle of energize"),
        FeelingDetail("relieved", "happy and relaxed because something bad has not happened or because a bad situation has ended"),
        FeelingDetail("unburden", "to take a problem or burden away from (someone or something)"),
        FeelingDetail("pleased", "happy and satisfied"),
        FeelingDetail("moving", "making you feel emotional"),
        FeelingDetail("touching", "making you feel emotional or sympathetic, for example by being sad"),
        FeelingDetail("confident", "certain that something will happen or that something is true"),
        FeelingDetail("self-confidence ", "the feeling that you can do things well and that people respect you")
    ],
    "Energized" : [
        FeelingDetail("interesting", "attracting your attention and making you want to learn more about something or to be involved in something, not dull or boring"),
        FeelingDetail("refreshing", "pleasantly new, different, or interesting"),
        FeelingDetail("elated", "very happy and excited"),
        FeelingDetail("energetic", "having or showing a lot of energy"),
        FeelingDetail("hopeful", "feeling something good will happen or be true"),
        FeelingDetail("anticipated", "to think that something will probably happen"),
        FeelingDetail("excited", "very happy and enthusiastic because something good is going to happen, especially when this makes you unable to relax"),
        FeelingDetail("liveliness", "full of energy and enthusiasm"),
        FeelingDetail("familiar", "frequently seen, heard, or experienced"),
        FeelingDetail("glad", "happy and pleased about something"),
        FeelingDetail("attractive", "having a feature or quality that people like"),
        FeelingDetail("thrilling", "very exciting"),
        FeelingDetail("refreshed", "feeling more lively and comfortable after you have rested, washed, eaten etc"),
        FeelingDetail("enjoy", "to take pleasure in (something)"),
        FeelingDetail("self-confidence ", "the feeling that you can do things well and that people respect you")
    ],
    "Comfort" : [
        FeelingDetail("relaxed", "calm and not worried"),
        FeelingDetail("easygoing", "relaxed and informal"),
        FeelingDetail("comfortable", "feeling physically relaxed, without any pain or other unpleasant feelings"),
        FeelingDetail("carefree", "having no worries or problems, free from care"),
        FeelingDetail("peaceful", "quiet and calm; without noise, excitement, etc."),
        FeelingDetail("calm","not affected by strong emotions such as excitement, anger, shock, or fear"),
        FeelingDetail("restful", "peaceful and quiet in a way that makes you relax"),
    ],
    "Boredom" : [
            FeelingDetail("boring", "not at all interesting, and making you feel impatient or dissatisfied"),
            FeelingDetail("tedious", "boring and too slow or long"),
            FeelingDetail("dull", "not exciting or interesting"),
            FeelingDetail("wearisome", "causing you to feel bored, annoyed, or impatient"),
            FeelingDetail("stuffy", "very formal, serious, or old-fashioned"),
            FeelingDetail("tiresome", "causing you to feel bored, annoyed, or impatient"),
            FeelingDetail("spiritless", "lacking courage, energy, or cheerfulness"),
            FeelingDetail("tired", "feeling a need to rest or sleep")
    ],
    "Depression / Sad" : [
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
    ],
    "Anger" : [
        FeelingDetail("upset", "to make someone worried, unhappy, or angry"),
        FeelingDetail("bothersome", "annoying or causing trouble"),
        FeelingDetail("furious", "extremely angry"),
        FeelingDetail("frustrated", "feeling annoyed or less confident because you cannot achieve what you want"),
        FeelingDetail("anxious", "worried and nervous"),
        FeelingDetail("awkward", "difficult to use, do, or deal with"),
        FeelingDetail("irritated", "annoyed"),
        FeelingDetail("uncomfortable", "not feeling comfortable and pleasant"),
        FeelingDetail("raging", "very strong or violent"),
        FeelingDetail("nervous", "worried and anxious"),
        FeelingDetail("chaotic", "in a state of total confusion with no order"),
        FeelingDetail("stress", "great worry caused by a difficult situation, or something that causes this condition")
    ],
    "Anxiety / heFear" : [
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
    ],
    "Confusion" : [
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
        FeelingDetail("", ""),
    ]
]// Feelings[Anger][]

let LastViewContext : [String] = [
    "Thank you for telling me your feelings honestly!",
    "Thanks to you, our town has become colorful!",
    "I hope it was a time for you to look into your mind.",
    "Every emotion you feel has its own meaning.",
    "And I love all the feelings you gave me.",
    "Let's meet again next time!",
    "Your heart is overflowing with love."
]

let ChangeLastViewContext : [String] = [
    "Thank you for telling me your feelings honestly!",
    "Thanks to you, our town has become colorful!",
    "I hope it was a time for you to look into your mind.",
    "I love all the feelings you gave me.",
    "And don't forget that feelings can change anytime you want :)",
    "I will always support you in your heart!",
    "Let's meet again next time!",
    "Your heart is overflowing with love."
]
