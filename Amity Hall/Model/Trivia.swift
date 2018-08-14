//
//  Question.swift
//  Amity Hall
//
//  Created by Nel Toms on 8/2/18.
//  Copyright © 2018 Parko Inc. All rights reserved.
//

import Foundation

class Trivia {
    
    let questionText : String
    let answer : String
    
    init(text: String, correctAnswer: String) {
        questionText = text
        answer = correctAnswer
    }
}
