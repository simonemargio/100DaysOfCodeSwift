//  Created by Simone Margio
//  www.simonemargio.im

import Cocoa
import CreateML

// Convert the csv file into ML data table
let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/ika/Downloads/twitter-sanders-apple3.csv"))

// Random split the data into training and testing data
let(trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)

// Create a new instance of ml model
// textColumn and labelColumn are the two column in twitter-sanders-apple3
let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")
// entimentClassifier is the ml model

// Now testing the data to evaluate how accurate it is
let evaluationMetrics = sentimentClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")

// Then use evaluationMetrics to figure out the accuracy
// We get the value in % on the accuracy
let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

// Save ml model
let metadata = MLModelMetadata(author: "Simone Margio", shortDescription: "A model trained to sentiment on Tweets", license: "1.0")
try sentimentClassifier.write(to: URL(fileURLWithPath: "/Users/ika/Downloads/TweetSentimentClassifier.mlmodel"))

// Test it
try sentimentClassifier.prediction(from: "@Apple is amazing company!")
try sentimentClassifier.prediction(from: "I just found the worst website ever, and It's @blablabla")
try sentimentClassifier.prediction(from: "I think @CocaCola ads are just ok.")
