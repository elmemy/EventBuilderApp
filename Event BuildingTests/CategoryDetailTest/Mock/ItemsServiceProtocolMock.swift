//
//  ItemsServiceProtocolMock.swift
//  Event BuildingTests
//
//  Created by elmemy on 23/02/2024.
//

import Foundation
import Combine
@testable import Event_Building

// MARK: - ItemsServiceProtocolMock
class ItemsServiceProtocolMock: ItemsServiceProtocol {
    var fetchItemsResult: AnyPublisher<[EventItem], NetworkError> = Empty().eraseToAnyPublisher()
    
    func fetchItems(for categoryID: Int) -> AnyPublisher<[EventItem], NetworkError> {
        return fetchItemsResult
    }
}
