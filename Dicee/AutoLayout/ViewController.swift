//
//  ViewController.swift
//  AutoLayout
//
//  Created by Nikita Zubov on 23.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let rollArray = [UIImage(named: "DiceOne"),
                     UIImage(named: "DiceTwo"),
                     UIImage(named: "DiceThree"),
                     UIImage(named: "DiceFour"),
                     UIImage(named: "DiceFive"),
                     UIImage(named: "DiceSix")
    ]
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImageViewOne.image = rollArray[Int.random(in: 0...5)]
        diceImageViewTwo.image = rollArray[Int.random(in: 0...5)]
    }
}

    
