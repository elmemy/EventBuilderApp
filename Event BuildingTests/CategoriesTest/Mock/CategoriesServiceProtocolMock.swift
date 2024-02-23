//
//  CategoriesServiceProtocolMock.swift
//  Event BuildingTests
//
//  Created by elmemy on 23/02/2024.
//

import Foundation
import Combine
@testable import Event_Building

class CategoriesServiceProtocolMock: CategoriesServiceProtocol {
    
    var fetchCategoriesCallCount = 0
    var fetchCategoriesResult: AnyPublisher<[CategoryModel], NetworkError> = Empty().eraseToAnyPublisher()
    
    func fetchCategories() -> AnyPublisher<[CategoryModel], NetworkError> {
        fetchCategoriesCallCount += 1
        return fetchCategoriesResult
    }
}
