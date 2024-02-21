//
//  NetworkManager.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.

// MARK: - Networking
// NetworkManager.swift

import Foundation

enum NetworkError: Error {
    case requestFailed(Error)
    case decodingFailed
}

protocol Networking {
    func fetchData<T: Decodable>(from url: URL) async throws -> T
}

class NetworkService: Networking {
    func fetchData<T: Decodable>(from url: URL) async throws -> T {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }
}
