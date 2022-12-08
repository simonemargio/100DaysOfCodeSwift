//  Created by Simone Margio.
//  www.simonemargio.im

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollButton(_ sender: UIButton) {
        print("Button pressed, yeeee!")
    }
    
}

