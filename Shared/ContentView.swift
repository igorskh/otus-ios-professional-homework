//
//  ContentView.swift
//  Shared
//
//  Created by Igor Kim on 09.11.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewController: ViewController = .init()
    
    @State private var showImagePicker = false
    
    var body: some View {
        VStack {
            if let image = viewController.image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 250)
                    .clipped()
            } else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 250)
                    .clipped()
            }
            
            if let label = viewController.classLabel {
                Text("Prediction: \(label)")
                    .padding()
            } else {
                Text("")
            }
            
            Button(action: {
                showImagePicker.toggle()
            }) {
                Text("Image Picker")
            }
        }
        .sheet(isPresented: $showImagePicker, onDismiss: viewController.loadImage) {
            ImagePicker(image: $viewController.inputImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
