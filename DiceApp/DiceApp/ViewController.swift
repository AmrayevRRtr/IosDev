//
//  ViewController.swift
//  DiceApp
//
//  Created by Ruslan Amrayev on 19.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lhsDice: UIImageView!
    @IBOutlet weak var rhsDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    let diceImages: [UIImage] = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    let diceImagesEnum: [UIImage] = [.diceOne, .diceTwo, .diceThree, .diceFour, .diceSix]

    override func viewDidLoad() {
        super.viewDidLoad()
        lhsDice.image = .diceOne
        rhsDice.image = .diceFive
        rollButton.layer.cornerRadius = 16
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollButtonDidTap(_ sender: UIButton) {
        let randomIndex = Int.random(in: 0..<diceImages.count)
        lhsDice.image = diceImages[randomIndex]
        rhsDice.image = diceImages.randomElement()
    }


}

