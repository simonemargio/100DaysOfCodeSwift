//  Created by Simone Margio
//  www.simonemargio.im

import CreateML
import Foundation

// Set folders path
let trainDirectory = URL(fileURLWithPath: "PATH-TO-TRAIN-FOLDER")
let testDirectory = URL(fileURLWithPath: "PATH-TO-TEST-FOLDER")

// Create the Model
let model = try MLImageClassifier(trainingData: .labeledDirectories(at: trainDirectory))

// Evaluate Model
let evaluation = model.evaluation(on: .labeledDirectories(at: testDirectory))

// Save model
try model.write(to: URL(fileURLWithPath: "AnimalClassifier.mlmodel"))
