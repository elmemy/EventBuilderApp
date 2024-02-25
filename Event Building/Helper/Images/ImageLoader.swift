//
//  ImageLoader.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    var urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }

    func loadImage(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                    completion(loadedImage)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
