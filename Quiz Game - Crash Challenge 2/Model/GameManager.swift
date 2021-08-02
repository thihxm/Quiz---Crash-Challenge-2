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
            label: "Qual o ano que o primeiro carro veio ao Brasil?",
            imageName: "Daimler",
            answers: [
                ("1820", false),
                ("1910", false),
                ("1893", true),
                ("1925", false),
            ]
        ),
        QuizQuestion(
            label: "Qual a primeira fábrica a produzir rádios para carros?",
            imageName: "Philco",
            answers: [
                ("Philco", true),
                ("Pioneer", false),
                ("Sony", false),
                ("Bosch", false),
            ]
        ),
        QuizQuestion(
            label: "Qual o valor da multa mais cara já emitida?",
            imageName: "Multa",
            answers: [
                ("US$15000", false),
                ("US$1 milhão", true),
                ("US$100 mil", false),
                ("US$50 mil", false),
            ]
        ),
        QuizQuestion(
            label: "Quem é a maior fabricante de carros por dia?",
            imageName: "Toyota",
            answers: [
                ("Volkswagen", false),
                ("GM", false),
                ("Fiat", false),
                ("Toyota", true),
            ]
        ),
        QuizQuestion(
            label: "Qual é a marca menos produzida no mundo por dia?",
            imageName: "Ferrari",
            answers: [
                ("Ferrari", true),
                ("Bugatti", false),
                ("Koenigsegg", false),
                ("Aston Martin", false),
            ]
        ),
        QuizQuestion(
            label: "Qual o país que teve o maior engarrafamento conhecido?",
            imageName: "Engarrafamento",
            answers: [
                ("Índia", false),
                ("China", true),
                ("Japão", false),
                ("Estados Unidos", false),
            ]
        ),
        QuizQuestion(
            label: "Qual o carro proporcionalmente mais popular do mundo?",
            imageName: "Ford T",
            answers: [
                ("Toyota Corolla", false),
                ("Honda Civic", false),
                ("Volkswagen Fusca", false),
                ("Ford T", true),
            ]
        ),
        QuizQuestion(
            label: "Qual marca de carro o canto Bob Marley dirigia?",
            imageName: "Bob Marley",
            answers: [
                ("Volkswagen", false),
                ("Audi", false),
                ("BMW", true),
                ("Porsche", false),
            ]
        ),
        QuizQuestion(
            label: "Qual o país com mais carros por habitante?",
            imageName: "Monaco",
            answers: [
                ("Alemanha", false),
                ("Estados Unidos", false),
                ("Mônaco", true),
                ("China", false),
            ]
        ),
        QuizQuestion(
            label: "Qual a marca de carro que transporta presidentes no Brasil desde a década de 50?",
            imageName: "Presidente",
            answers: [
                ("Rolls-Royce", true),
                ("Aston Martin", false),
                ("Bentley", false),
                ("Jaguar", false),
            ]
        ),
    ]
    
    var correctAnswers: [QuizQuestion] = []
    var wrongAnswers: [QuizQuestion] = []
}
