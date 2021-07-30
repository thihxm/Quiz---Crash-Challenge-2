//
//  ViewController.swift
//  Quiz Game - Crash Challenge 2
//
//  Created by Thiago Medeiros on 27/07/21.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var answersCollectionView: UICollectionView!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    private let reuseIdentifier = "AnswerCell"
    private let question = QuizQuestion(
        label: "Esta logo pertence a qual marca?",
        imageName: "Ferrari",
        answers: [
            ("Mercedes-Benz", false),
            ("Maserati", false),
            ("Ferrari", true),
            ("Lamborghini", false)
        ]
    )
    private let cornerRadius: CGFloat = 24
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor(named: "Light Green")!.cgColor, UIColor(named: "Green")!.cgColor]
        gradient.locations = [0, 0.45]
        view.layer.insertSublayer(gradient, at: 0)
        
        if let questionImage = UIImage(named: question.imageName) {
            let colorlessImage = questionImage.withRenderingMode(.alwaysTemplate)
            questionImageView.image = colorlessImage
            questionImageView.tintColor = .gray.withAlphaComponent(0.7)
        }
        questionImageView.layer.cornerRadius = self.cornerRadius
        questionImageView.layer.masksToBounds = true
        
        questionLabel.text = question.label
        
        answersCollectionView.backgroundColor = .clear
    }

}

extension QuestionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()

        if let answerCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AnswerCollectionViewCell {
            let answer = question.answers[indexPath.row]
            answerCell.configure(with: answer.label)

            cell = answerCell
        }

        return cell
    }
}

extension QuestionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let clickedAnswer = question.answers[indexPath.row]
        print("Selected Answer is correct? \(clickedAnswer.isCorrect)")
    }
}

