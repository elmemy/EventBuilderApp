//
//  ImageCache.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

import SwiftUI
import Combine

class ImageCache {
    static let shared = ImageCache()
    private var cache: NSCache<NSString, UIImage> = NSCache()

    func getImage(urlString: String) -> UIImage? {
        return cache.object(forKey: NSString(string: urlString))
    }

    func setImage(urlString: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: urlString))
    }
}


