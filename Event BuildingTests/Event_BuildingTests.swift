//
//  Event_BuildingTests.swift
//  Event BuildingTests
//
//  Created by elmemy on 19/02/2024.

import XCTest
@testable import Event_Building

class MockNetworking: Networking {
    var fetchDataResult: Result<Data, Error>?

    func fetchData<T: Decodable>(from url: URL) async throws -> T {
        guard let result = fetchDataResult else {
            fatalError("fetchDataResult not set for testing.")
        }

        switch result {
        case .success(let data):
            return try JSONDecoder().decode(T.self, from: data)
        case .failure(let error):
            throw error
        }
    }
}

class EventViewModelTests: XCTestCase {
    var viewModel: EventViewModel!
    var mockNetworking: MockNetworking!

    override func setUp() {
        super.setUp()
        mockNetworking = MockNetworking()
        viewModel = EventViewModel(networking: mockNetworking)
    }

    override func tearDown() {
        viewModel = nil
        mockNetworking = nil
        super.tearDown()
    }

 
    func testFetchCategoriesFailure() async {
        // Arrange
        let expectedError = NetworkError.decodingFailed
        mockNetworking.fetchDataResult = Result.failure(expectedError)

        // Act
        await viewModel.fetchCategories()

        // Assert
        XCTAssertTrue(viewModel.categories.isEmpty)
    }


    func testAddItem() {
        // Arrange
        let itemToAdd = EventItem(id: 1, title: "Item 1", minBudget: 10.0, maxBudget: 20.0, avgBudget: 15.0, image: "item1")

        // Act
        viewModel.addItem(itemToAdd)

        // Assert
        XCTAssertTrue(viewModel.addedItems.contains(itemToAdd))
    }
    
  
}
