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
        answerLabel.tintColor = UIColor(named: "RBR Blue")
    }

    func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = contentView.bounds
        gradient.colors = [UIColor(named: "RBR Light Yellow")!.cgColor, UIColor(named: "RBR Yellow")!.cgColor]
        gradient.cornerRadius = 24
        contentView.layer.insertSublayer(gradient, at: 0)

        contentView.layer.borderWidth = 1.0

        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.cornerRadius = 24
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = false
        clipsToBounds = false

        contentView.layer.masksToBounds = false
        contentView.layer.shadowColor = UIColor(named: "Dark Gray")!.cgColor
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 0.7
        contentView.layer.shadowOffset = CGSize(width: 5, height: 5)
        contentView.layer.shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: 24).cgPath
    }

}
