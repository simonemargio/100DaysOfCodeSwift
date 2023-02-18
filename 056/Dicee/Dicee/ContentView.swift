//
//  Created by Simone Margio
//  www.simonemargio.im
//


import SwiftUI


struct ContentView: View {
    
    /*
        In Swift if we have a struct with variables and in the struct we change the value of these variables we must define them Immutable.
        
        In SwiftUI it uses @State instead. This property means that when a @State variable changes, the Struct where the variable is defined is recreated.
     
        More info: https://developer.apple.com/documentation/swiftui/state
     */
    @State var leftDiceNumber = 1
    @State  var rightDiceNumber = 1
    
    var body: some View {
        
        // Put background and logo into ZStack
        ZStack {
            Image(ImageData.backgroundImage)
                .resizable()
                .edgesIgnoringSafeArea(.all)
           
            // All elements in VStack
            VStack {
                Image(ImageData.logoImage)
                
                Spacer()
                
                // Ricee in HStack to have the
                // two data on the same horizontal line
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
             
                Spacer()
                
                // Padding
                // Font size
                // Add "bold" style with fontWeight
                // Color and padding
                // Kawaii radius
                Button("Roll") {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }
                .padding(.horizontal)
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .background(Color(ImageData.buttonColor))
                .cornerRadius(10)
                
                
                Spacer()
            }
           
           
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    

struct DiceView: View {
    // Dice number
    let n: Int
  
    var body: some View {
        // aspectRatio(1 = one to one in vertical and horizontal
        // \(imageData.diceImage)\(n) = for example "dicee1"
        Image("\(ImageData.diceImage)\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
    
  
}
