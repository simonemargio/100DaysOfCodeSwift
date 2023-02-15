//
//  ContentView.swift
//  BusinessCard
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        ZStack {
            // Add full gradient color background
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                // Set resizable mode
                // Constrains Image view’s dimensions to the specified aspect ratio
                // Give 150x150px
                // Circle image
                // Layer a secondary view in front of Image
                // With this we have teo view: Image and above this Overlay
                // Give a circle shape to Overlay
                // Use stroke to have only a white outline in size 5
                Image("simonemargiologo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                
                // For add a custom font:
                // Download ttf font
                // Import it (in this case into Font folder)
                // In info.plist add a new key "Fonts provided by application"
                // Expand it and in value add the name of ttf file
                Text("Simone Margio")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                
                Text("Software engineer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                
                // Small line to divide the view
                // Better without
                // Divider()
                
                // Create a rettangle shape
                // Fill it with white color
                // Add on it a Text view
                // In .frame we delete width so the rectangle will occupy all the horizontal space
                // Add an overlay with H stack for an Image and Text
                // Finally add padding
                // command + left click and select (Extract Subwiew):
                // with this we can use ExtractedView (colled InfoView) for duplicate the view
                // and refactoring the code with a new swiftUI file (InfoView) where the
                // InfoView structure is defined
                InfoView(icon: "house.fill", text: "Website")
                InfoView(icon: "envelope.fill", text: "Email")
            
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

