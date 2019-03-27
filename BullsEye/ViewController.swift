//
//  ViewController.swift
//  BullsEye
//
//  Created by Tommy Hansen on 25/03/2019.
//  Copyright © 2019 Tommy Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let title: String
        
        if (difference == 0) {
            title = "Perfect!"
            points += 100
        } else if (difference < 5) {
            title = "You almost had it!"
            points += 50
        } else if (difference < 10) {
            title = "Pretty Good!"
        } else {
            title = "Not even close..."
        }
        score += points

        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "O.K",
                                   style: .default,
                                   handler: {_ in self.startNewRound()})
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("The value of the slider is now: \(currentValue)")
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        startNewGame()
    }
    
    fileprivate func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }    
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

