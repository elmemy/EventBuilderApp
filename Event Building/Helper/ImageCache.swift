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

struct AsyncImage: View {
    @StateObject private var imageLoader: ImageLoader
    @State private var image: UIImage?

    init(url: String) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(urlString: url))
    }

    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            Rectangle()
                .foregroundColor(.gray)
                .onAppear {
                    loadImage()
                }
        }
    }

    private func loadImage() {
        guard URL(string: imageLoader.urlString) != nil else { return }

        if let cachedImage = ImageCache.shared.getImage(urlString: imageLoader.urlString) {
            image = cachedImage
        } else {
            imageLoader.loadImage { loadedImage in
                if let loadedImage = loadedImage {
                    ImageCache.shared.setImage(urlString: imageLoader.urlString, image: loadedImage)
                    image = loadedImage
                }
            }
        }
    }
}

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
