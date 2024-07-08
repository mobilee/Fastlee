//
//  UIImage+Compressed.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 08/07/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import UIKit

public extension UIImage {
    func compressImage(_ maxSize: CGSize) -> Data? {
        let data = flattenImage()?
            .resized(to: maxSize)?
            .jpegData(compressionQuality: 0.72)
        
        logInfo(message: "🏋️ Image weights: \(data?.count ?? 0) bytes")
        return data
    }
    
    func flattenImage() -> UIImage? {
        guard let ciImage = CIImage(image: self) else {
            return nil
        }
        
        let filter = CIFilter(name: "CIMedianFilter")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        guard let outputImage = filter?.outputImage else {
            return nil
        }
        
        let context = CIContext(options: nil)
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return nil
        }
        
        return UIImage(cgImage: cgImage)
    }
}
