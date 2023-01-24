//
//  ImageManager.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

import Foundation

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImageData(from url: URL?, completion: @escaping (Data) -> Void) {
        if let url = url {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        return completion(imageData)
                    }
                }
            }
        }
    }
}

