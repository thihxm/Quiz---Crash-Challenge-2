//
//  AnswerCollectionViewCell.swift
//  Quiz Game - Crash Challenge 2
//
//  Created by Thiago Medeiros on 28/07/21.
//

import UIKit

class AnswerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var answerLabel: UILabel!
    
    func configure(with answer: String) {
        answerLabel.text = answer
    }
}
