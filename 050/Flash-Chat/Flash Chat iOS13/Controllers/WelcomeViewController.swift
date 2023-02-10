//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    // When the main screen appears, hide the navigation bar
    // This will hide the navigation bar for all other screens.
    // So let's use the method viewWillDisappear
    override func viewWillAppear(_ animated: Bool) {
        // This for Apple documentation
        // https://developer.apple.com/documentation/uikit/uiviewcontroller/1621510-viewwillappear
        // "If you override this method, you must call super at some point in your implementation"
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    // When the main screen disappears
    //(we pass from the main screen to another such as login or register)
    // we put the navigation bar back
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = ""
        let titleText = K.appInfo.appName
        var charIndex = 0.0
        
        // Animation title
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) {
                (timer) in // (timer) = name of the timer
                self.titleLabel.text?.append(letter)
                
            }
            charIndex += 1
        }

       
    }
    

}
