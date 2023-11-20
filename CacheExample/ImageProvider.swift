//
//  ImageProvider.swift
//  CacheExample
//
//  Created by Talib on 13/06/23.
//

import Foundation
import UIKit


class ImageProvider {
    static let shared = ImageProvider()
    
    private let cache = NSCache<NSString,UIImage>()
    
    private init(){}
    
    public func  fetchImage(completion:@escaping (UIImage?)->Void){
    
        if let image = cache.object(forKey:"image") {
            print("Using Cache")
            completion(image)
            return
        }
        
        
        guard let url = URL(string:"https://source.unsplash.com/random/500*500") else {
            completion(nil)
            return
        }
        print("Fetching Image")
        let task = URLSession.shared.dataTask(with:url) { data, _, error in
            guard let data = data ,error == nil else {
                completion(nil)
                return
                
            }
            DispatchQueue.main.async {
                guard  let image = UIImage(data:data) else {
                    completion(nil)
                    return
                }
                self.cache.setObject(image, forKey:"image")
                completion(image)
            }
            
        }
        task.resume()
    }
}
