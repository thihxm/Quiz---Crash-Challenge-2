//
//  GameManager.swift
//  Quiz Game - Crash Challenge 2
//
//  Created by Thiago Medeiros on 30/07/21.
//

import Foundation

class GameManager {
    static let instace = GameManager()
    var currentQuestion = 0

    var questions: [QuizQuestion] = [
        QuizQuestion(
            label: "Esta logo pertence a qual marca?",
            imageName: "Ferrari",
            answers: [
                ("Mercedes-Benz", false),
                ("Maserati", false),
                ("Ferrari", true),
                ("Lamborghini", false)
            ]
        ),
        QuizQuestion(
            label: "De qual marce é esta logo?",
            imageName: "Bugatti",
            answers: [
                ("Lamborghini", false),
                ("Fiat", false),
                ("Ford", false),
                ("Bugatti", true)
            ]
        ),
    ]
}
