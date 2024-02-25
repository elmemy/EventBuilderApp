//
//  ItemsService.swift
//  Event Building
//
//  Created by elmemy on 23/02/2024.
//

import Foundation
import Combine


// MARK: - ItemsServiceProtocol
/// Protocol defining methods for fetching items.
protocol ItemsServiceProtocol {
    /// Fetches items for a given category ID.
    func fetchItems(for categoryID: Int) -> AnyPublisher<[EventItem], NetworkError>
}


// MARK: - ItemsService
/// Class responsible for fetching items.
class ItemsService: ItemsServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    /// Initializes the items service with a network service.
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    /// Fetches items for a given category ID.
    func fetchItems(for categoryID: Int) -> AnyPublisher<[EventItem], NetworkError> {
        let endpoint = Endpoint(path: APITarget.items(categoryID: categoryID).path, method: .get)
        return networkService.fetch(endpoint)
    }
}
