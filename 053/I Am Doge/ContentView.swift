//
//  ContentView.swift
//  I Am Doge
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import SwiftUI

// Define what the user interface looks like and how it should behave
struct ContentView: View {

    var body: some View {
        // ZStack: a view that overlays its subviews and aligning them in both axes
        // Each element in the ZStack is superimposed on the previous element
        // If I create: background, label and an image I will have that the image will be above the label which in turn is above the background
        ZStack {
            
            // Color background
            // Set the color on entire screen ignoring the safe area
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)

            
            // Label
            // VStack works the same as ZStack except that the elements are organized vertically
            VStack {
                Text("I Am Doge!")
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
                    .bold()
                Image("doge")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300.0, height: 300.0, alignment: .center)
            }
        }
    }
}

// How the preview should be shown and how it should behave
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // For exemple we can change the device
        // ContentView().previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
    }
}
