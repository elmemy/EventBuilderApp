//
//  NetworkServiceProtocol.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

import Combine
// MARK: - NetworkServiceProtocol

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, NetworkError>
}
