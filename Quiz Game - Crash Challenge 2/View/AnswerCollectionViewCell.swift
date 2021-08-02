//
//  AnswerCollectionViewCell.swift
//  Quiz Game - Crash Challenge 2
//
//  Created by Thiago Medeiros on 28/07/21.
//

import UIKit

class AnswerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var answerLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    func configure(with answer: String) {
        answerLabel.text = answer
        answerLabel.tintColor = UIColor(named: "RBR Dark Blue")
        answerLabel.alpha = 1
        self.backgroundColor = .white
    }

    func setupView() {
//        let gradient = CAGradientLayer()
//        gradient.frame = contentView.bounds
//        gradient.colors = [UIColor(named: "RBR Light Yellow")!.cgColor, UIColor(named: "RBR Yellow")!.cgColor]
//        gradient.cornerRadius = 8
//        contentView.layer.insertSublayer(gradient, at: 0)

        self.backgroundColor = .white
        self.layer.borderWidth = 1.0

        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.clipsToBounds = false
        clipsToBounds = false

        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(named: "ButtonShadow")!.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 8).cgPath
//        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }

}
