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
    
    private let reuseIdentifier = "AnswerCell"
    private let answers = ["Answer 1", "Answer 2", "Answer 3", "Answer 4"]
    private let cornerRadius: CGFloat = 24
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionImageView.layer.cornerRadius = self.cornerRadius
    }

}

extension QuestionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()

        if let answerCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AnswerCollectionViewCell {
            answerCell.configure(with: answers[indexPath.row])

            cell = answerCell
        }
        cell.layer.cornerRadius = self.cornerRadius
        cell.backgroundColor = UIColor.red

        return cell
    }
}

