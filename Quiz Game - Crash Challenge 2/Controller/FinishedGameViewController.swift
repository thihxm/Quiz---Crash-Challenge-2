//
//  FinishedGameViewController.swift
//  Quiz Game - Crash Challenge 2
//
//  Created by Thiago Medeiros on 02/08/21.
//

import UIKit

class FinishedGameViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor(named: "GradientLight")!.cgColor, UIColor(named: "GradientDark")!.cgColor]
        gradient.locations = [0, 0.65]
        
        view.layer.insertSublayer(gradient, at: 0)
        
        messageLabel.text = "Parabéns você completou o quiz! Você acertou \(GameManager.instace.correctAnswers.count) e errou \(GameManager.instace.wrongAnswers.count) perguntas!"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
