//
//  TriviaBank.swift
//  Amity Hall
//
//  Created by Nel Toms on 8/2/18.
//  Copyright © 2018 Parko Inc. All rights reserved.
//

import Foundation

class TriviaBank {
    
    var list = [Trivia]()
    
    init() {
        
        list.append(Trivia(text: "How does one go about creating the most lucrative Trivia Night in New York City?", correctAnswer: "Genius"))
        
        list.append(Trivia(text: "What color is a slug\'s blood?", correctAnswer: "Green"))
        
        list.append(Trivia(text: "What ratio of human bones are in the feet? (should be a word, not a number)", correctAnswer: "quarter"))
        
       list.append(Trivia(text: "The total surface area of two human lungs is approximately how many square metres?", correctAnswer: "70"))
        
       list.append(Trivia(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAnswer: "true"))
//        
//        list.append(Trivia(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAnswer: false))
//        
//        list.append(Trivia(text: "It is illegal to pee in the Ocean in Portugal.", correctAnswer: true))
//        
//        list.append(Trivia(text: "You can lead a cow down stairs but not up stairs.", correctAnswer: false))
//        
//        list.append(Trivia(text: "Google was originally called \"Backrub\".", correctAnswer: true))
//        
//        list.append(Trivia(text: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", correctAnswer: true))
//        
//        list.append(Trivia(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: false))
//        
//        list.append(Trivia(text: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: false))
//        
//        list.append(Trivia(text: "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.", correctAnswer: true))
        
    }
}
