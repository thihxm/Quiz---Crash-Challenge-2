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
    @IBOutlet weak var amountOfQuestionsLabel: UILabel!
    
    private let reuseIdentifier = "AnswerCell"
    private let cornerRadius: CGFloat = 24
    private var amountOfQuestion: Int = 1
    
    private var question = GameManager.instace.questions[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor(named: "GradientLight")!.cgColor, UIColor(named: "GradientDark")!.cgColor]
        gradient.locations = [0, 0.65]

//        let x: Double! = 45 / 360.0
//        let a = pow(sinf(Float(2 * Double.pi * ((x + 0.75) / 2.0))), 2)
//        let b = pow(sinf(Float(2 * Double.pi * ((x + 0.0) / 2))), 2)
//        let c = pow(sinf(Float(2 * Double.pi * ((x + 0.25) / 2))), 2)
//        let d = pow(sinf(Float(2 * Double.pi * ((x + 0.5) / 2))), 2)
//
//        gradient.endPoint = CGPoint(x: CGFloat(c), y: CGFloat(d))
//        gradient.startPoint = CGPoint(x: CGFloat(a), y:CGFloat(b))
        
        view.layer.insertSublayer(gradient, at: 0)
        amountOfQuestion = GameManager.instace.questions.count
        
        amountOfQuestionsLabel.text = "\(1)/\(amountOfQuestion)"
        
//        if let questionImage = UIImage(named: question.imageName) {
//            let colorlessImage = questionImage.withRenderingMode(.alwaysTemplate)
//            questionImageView.image = colorlessImage
//            questionImageView.tintColor = .gray.withAlphaComponent(0.7)
//        }
        questionImageView.image = UIImage(named: question.imageName)
        questionImageView.layer.cornerRadius = self.cornerRadius
        questionImageView.layer.masksToBounds = true
        
        questionLabel.text = question.label
        
        answersCollectionView.backgroundColor = .clear
    }
    
    func updateQuestion() {
        let currentQuestion = GameManager.instace.currentQuestion
        question = GameManager.instace.questions[currentQuestion]
        
//        if let questionImage = UIImage(named: question.imageName) {
//            let colorlessImage = questionImage.withRenderingMode(.alwaysTemplate)
//            questionImageView.image = colorlessImage
//            questionImageView.tintColor = .gray.withAlphaComponent(0.7)
//        }
        questionImageView.image = UIImage(named: question.imageName)
        questionImageView.layer.cornerRadius = self.cornerRadius
        questionImageView.layer.masksToBounds = true

        questionLabel.text = question.label

        answersCollectionView.reloadData()
    }

}

extension QuestionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()

        if let answerCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AnswerCollectionViewCell {
            let answer = question.answers[indexPath.row]
            answerCell.configure(with: answer.label)
            answerCell.customAnimation(.flip)

            cell = answerCell
        }

        return cell
    }
}

extension QuestionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let clickedAnswer = question.answers[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath) as! AnswerCollectionViewCell
        
        collectionView.visibleCells.forEach { collectionCell in
            let cellAsAnswer = collectionCell as! AnswerCollectionViewCell
            guard cellAsAnswer != cell else {
                return
            }
            cellAsAnswer.answerLabel.alpha = 0
            cellAsAnswer.backgroundColor = UIColor(named: "ButtonShadow")
            cellAsAnswer.customAnimation(.flip)
        }

        GameManager.instace.currentQuestion += 1
        if GameManager.instace.questions.count <= GameManager.instace.currentQuestion {
            GameManager.instace.currentQuestion = 0
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let finishedGameVC = storyBoard.instantiateViewController(withIdentifier: "FinishedGameViewController") as! FinishedGameViewController
            finishedGameVC.modalPresentationStyle = .fullScreen
            present(finishedGameVC, animated: true)
        } else {        
            amountOfQuestionsLabel.text = "\(GameManager.instace.currentQuestion + 1)/\(amountOfQuestion)"
        }

        if clickedAnswer.isCorrect {
            GameManager.instace.correctAnswers.append(question)
            cell.customAnimation(.correctAnswer, completion: {
                cell.backgroundColor = UIColor(named: "ButtonShadow")
                self.updateQuestion()
            })
        } else {
            GameManager.instace.wrongAnswers.append(question)
            cell.customAnimation(.wrongAnswer, completion: {
                self.updateQuestion()
            })
        }
        print("Selected Answer is correct? \(clickedAnswer.isCorrect)")
    }
}

extension UIView {
    enum AnimationType {
        case flip, wrongAnswer, correctAnswer
    }

    func customAnimation(_ method: AnimationType, completion: @escaping () -> Void = {}) {
        switch method {
        case .flip:
            UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        case .wrongAnswer:
            UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseIn, animations: {
                self.backgroundColor = UIColor(named: "RBR Red")
            }, completion: {_ in
                self.customAnimation(.flip)
                completion()
            })
        case .correctAnswer:
            UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseIn, animations: {
                self.backgroundColor = UIColor(named: "Green")
            }, completion: {_ in
                self.customAnimation(.flip)
                completion()
            })
        }
    }
}

