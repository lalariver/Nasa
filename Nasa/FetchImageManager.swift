//
//  FetchImageManager.swift
//  Nasa
//
//  Created by user on 2024/5/10.
//

import Foundation
import UIKit

class FetchImageManager {
    static let shared = FetchImageManager()
    
    private let imageCache = NSCache<NSString, UIImage>()
    
    public func fetchImage(url: String?, completion: @escaping (UIImage?) -> ()) {
        guard let urlNSString = url as? NSString,
              let url = url
        else { return }
        
        if let image = imageCache.object(forKey: urlNSString) {
            completion(image)
        } else {
            guard let url = URL(string: url) else {
                completion(nil)
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(nil)
                    return
                }
                
                guard let image = UIImage(data: data) else { return }
                self.imageCache.setObject(image, forKey: urlNSString)
                completion(image)
            }
            
            task.resume()
        }
    }
}
