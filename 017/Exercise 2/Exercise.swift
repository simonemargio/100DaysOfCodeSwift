func highestScore(scores: [String: Int]) {
  var bestScore = 0
  
  for student in scores {
    let currentScore = student.value
    if currentScore >= bestScore {
      bestScore = currentScore
    }
  }
  
  print(bestScore)
}

highestScore(scores: ["Amy": 78, "James": 54, "Helen": 92])