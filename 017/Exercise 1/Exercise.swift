func exercise() {

    var stockTickers: [String: String] = [
      "APPL" : "Apple Inc", 
    	"HOG": "Harley-Davidson Inc", 
    	"BOOM": "Dynamic Materials", 
    	"HEINY": "Heineken", 
    	"BEN": "Franklin Resources Inc"
    ]
    
    stockTickers["WORK"] = "Slack Techologies Inc"
    stockTickers["BOOM"] = "DMC Global Inc"
  
    print(stockTickers["WORK"]!)
    print(stockTickers["BOOM"]!)
}
 