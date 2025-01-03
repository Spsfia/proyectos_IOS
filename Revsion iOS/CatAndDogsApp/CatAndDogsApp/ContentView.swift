//
//  ContentView.swift
//  CatAndDogsApp
//
//  Created by Adriana Sofia on 13/12/24.
//

import SwiftUI
import CoreML

extension UIImage {
    
    // https://www.hackingwithswift.com/whats-new-in-ios-11
    func toCVPixelBuffer() -> CVPixelBuffer? {
           
           let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
             var pixelBuffer : CVPixelBuffer?
             let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(self.size.width), Int(self.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
             guard (status == kCVReturnSuccess) else {
               return nil
             }

             CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
             let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)

             let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
             let context = CGContext(data: pixelData, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

             context?.translateBy(x: 0, y: self.size.height)
             context?.scaleBy(x: 1.0, y: -1.0)

             UIGraphicsPushContext(context!)
             self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
             UIGraphicsPopContext()
             CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

             return pixelBuffer
       }
}

struct ContentView: View {
    
    let images = ["dog932","cat64", "cat65", "cat70", "dog933", "dog938", "dog939"]
    var imageClassifier: CatDogImageClassifier1Model?
    @State private var currentIndex = 0
    @State private var classLabel: String = ""
    
    init() {
        do {
            imageClassifier = try CatDogImageClassifier1Model(configuration: MLModelConfiguration())
        }catch{
            print(error)
        }
    }
    
    var isPreviousButtonValid: Bool {
        currentIndex != 0
    }
    
    var isNextButtonValid: Bool {
        currentIndex < images.count - 1
    }
    
    var body: some View {
        VStack {
            Image(images[currentIndex])
            Button("Predecir") {
                
                // uiImage
                guard let uiImage = UIImage(named: images[currentIndex]) else { return }
                
                // pixel buffer
                guard let pixelBuffer = uiImage.toCVPixelBuffer() else { return }
                
                do {
                    let result = try imageClassifier?.prediction(image: pixelBuffer)
                    classLabel = result?.target ?? ""
                    //classLabel = result?.classLabel ?? ""
                } catch {
                    print(error)
                }
                
            }.buttonStyle(.borderedProminent)
            
            Text(classLabel)
            
            HStack {
                
                Button("Previous") {
                    currentIndex -= 1
                }.disabled(!isPreviousButtonValid)
                
                Button("Next") {
                    currentIndex += 1
                }
                .disabled(!isNextButtonValid)
                .padding()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
