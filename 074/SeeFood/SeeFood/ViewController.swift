//
//  ViewController.swift
//  SeeFood
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imagePicker.delegate = self
        // Allow to take an image by the camera
        imagePicker.sourceType = .camera
        // Don't allow to edit a selected image/video
        imagePicker.allowsEditing = false
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Pick user's image
        if let image = info[UIImagePickerController.InfoKey.originalImage] {
            imageView.image = image as? UIImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        // Show camera picker
        present(imagePicker, animated: true, completion: nil)
    }
}

