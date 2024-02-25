//
//  AsyncImage.swift
//  Event Building
//
//  Created by elmemy on 23/02/2024.
//

import SwiftUI

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
