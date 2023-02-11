//
//  ViewController2.swift
//  ViewControllerLifecycle
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var label: UILabel!
     
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "hello"
        
        print("VC 2 viewDidLoad Called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC 2 viewWillAppear Called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC 2 viewDidAppear Called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC 2 viewWillDisappear Called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC 2 viewDidDisappear Called")
    }

}
