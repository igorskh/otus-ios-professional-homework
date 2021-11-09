//
//  ViewController.swift
//  otus-ios-professional
//
//  Created by Igor Kim on 09.11.21.
//

import SwiftUI
import CoreML

class ViewController: ObservableObject {
    @Published var inputImage: UIImage?
    
    @Published private(set) var image: Image?
    @Published private(set) var classLabel: String?
    
    private let model: CatsAndDogsClassifier?
    
    init() {
        model = try? CatsAndDogsClassifier(configuration: MLModelConfiguration())
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        if let cvPixelBuffer = inputImage.toCVPixelBuffer(),
           let result = try? model?.prediction(image: cvPixelBuffer) {
            let prob = result.classLabelProbs[result.classLabel] ?? 0.0
            
            classLabel = "\(result.classLabel) (\((prob*100).rounded())%)"
        }
    }
}
