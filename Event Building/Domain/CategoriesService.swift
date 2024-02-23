//
//  CategoriesService.swift
//  Event Building
//
//  Created by elmemy on 23/02/2024.
//

import Foundation
import Combine

// MARK: - CategoriesServiceProtocol

/// Protocol defining methods for fetching categories.
protocol CategoriesServiceProtocol {
    /// Fetches categories from the network.
    func fetchCategories() -> AnyPublisher<[CategoryModel], NetworkError>
}

// MARK: - CategoriesService

/// Class responsible for fetching categories.
class CategoriesService: CategoriesServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    /// Initializes the categories service with a network service.
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    /// Fetches categories from the network.
    func fetchCategories() -> AnyPublisher<[CategoryModel], NetworkError> {
        let endpoint = Endpoint(path: APITarget.categories.path, method: .get)
        return networkService.fetch(endpoint)
    }
}
