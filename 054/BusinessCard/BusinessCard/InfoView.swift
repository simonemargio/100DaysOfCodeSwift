//
//  InfoView.swift
//  BusinessCard
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import SwiftUI


struct InfoView: View {
    let icon: String
    let text: String
    
    var body: some View {
        // Image and Text have a specific color named
        // MyColor. This color is black in light and dark mode
        // because the rounded rectangle is always white
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: self.icon ).foregroundColor(Color("MyColor"))
                Text(verbatim: self.text).foregroundColor(Color("MyColor"))
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        // Invented parameters for see the preview
        // of single InfoView element
        // previewLayout(.sizeThatFits) render the preview of size of InfoWiew
        InfoView(icon: "house.fill", text: "Hello").previewLayout(.sizeThatFits)
    }
}
