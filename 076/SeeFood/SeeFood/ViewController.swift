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
            
            // Convert UIImage into CIImage for coreML
            guard let ciimage = CIImage(image: image as! UIImage) else {
                fatalError("Could not convert to CIImage!")
            }
            
            detect(image: ciimage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    func detect(image: CIImage) {
        // Laod the model based on Inceptionv3
        // With model we can classify the images
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML failed!")
        }
        
        // Create a CoreML request and execute it
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to precess image!")
            }
            
            // Show the result
            // We take the first item in the list of results obtained
            // is the one with the highest recognition percentage
            if let firstResult = results.first {
                if firstResult.identifier.contains("hotdog") {
                    self.navigationItem.title = "Hotdog!"
                } else {
                    self.navigationItem.title = "Not Hotdog!"
                }
            }
            
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        }catch {
            print(error)
        }
        
    }
    
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        // Show camera picker
        present(imagePicker, animated: true, completion: nil)
    }
}

