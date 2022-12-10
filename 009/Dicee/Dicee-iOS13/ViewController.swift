//  Created by Simone Margio.
//  www.simonemargio.im

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let diceFace = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollButton(_ sender: UIButton) {
        print("Button pressed!")
        diceImageView1.image = UIImage(named: diceFace[Int.random(in: 0...5)])
        diceImageView2.image = UIImage(named: diceFace[Int.random(in: 0...5)])
    }
    
}

