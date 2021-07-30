//
//  QuizQuestion.swift
//  Quiz Game - Crash Challenge 2
//
//  Created by Thiago Medeiros on 29/07/21.
//

import Foundation

class QuizQuestion {
    let label: String
    let imageName: String
    let answers: [(label: String, isCorrect: Bool)]
    
    init(label: String, imageName: String, answers: [(label: String, isCorrect: Bool)]) {
        self.label = label
        self.imageName = imageName
        self.answers = answers
    }
}
