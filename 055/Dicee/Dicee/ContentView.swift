//
//  Created by Simone Margio
//  www.simonemargio.im
//


import SwiftUI


struct ContentView: View {
    
    
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
                    DiceView(n: 1)
                    DiceView(n: 2)
                }
                .padding(.horizontal)
             
                Spacer()
                
                // Padding
                // Font size
                // Add "bold" style with fontWeight
                // Color and padding
                // Kawaii radius
                Button("Roll") {
                    
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
