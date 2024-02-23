//
//  CategoryDetailViewModelTests.swift
//  Event BuildingTests
//
//  Created by elmemy on 23/02/2024.
//

import XCTest
import Combine
@testable import Event_Building

class CategoryDetailViewModelTests: XCTestCase {
    
    var viewModel: CategoryDetailViewModel!
    var itemsServiceMock: ItemsServiceProtocolMock!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        itemsServiceMock = ItemsServiceProtocolMock()
        viewModel = CategoryDetailViewModel(itemsService: itemsServiceMock)
    }
    
    override func tearDown() {
        viewModel = nil
        itemsServiceMock = nil
        cancellables = []
        super.tearDown()
    }
    
    func testFetchItems_Success() async {
        // Given
        let expectedItems = [
            EventItem(id: 1, title: "Item 1", minBudget: 10.0, maxBudget: 20.0, avgBudget: 15.0, image: "image1"),
            EventItem(id: 2, title: "Item 2", minBudget: 15.0, maxBudget: 25.0, avgBudget: 20.0, image: "image2")
        ]
        let category = CategoryModel(id: 1, title: "Category 1", image: "category_image")
        itemsServiceMock.fetchItemsResult = Just(expectedItems)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
        
        // When
        await viewModel.fetchItems(for: category)
        
        // Wait for the asynchronous operation to complete
        let expectation = XCTestExpectation(description: "Fetching items")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            expectation.fulfill()
        }
        
        XCTWaiter().wait(for: [expectation], timeout: 5) // Adjust timeout if necessary
        
        
        // Then
        XCTAssertEqual(viewModel.loaderState, .loaded)
        XCTAssertEqual(viewModel.items, expectedItems)
    }
    
    
    func testFetchItems_Failure() async {
        // Given
        let expectedError = NetworkError.unknown
        let category = CategoryModel(id: 1, title: "Category 1", image: "category_image")
        itemsServiceMock.fetchItemsResult = Fail(error: expectedError).eraseToAnyPublisher()
        
        // When
        await viewModel.fetchItems(for: category)
        
        // Wait for the asynchronous operation to complete
        let expectation = XCTestExpectation(description: "Fetching items")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            expectation.fulfill()
        }
        XCTWaiter().wait(for: [expectation], timeout: 5) // Adjust timeout if necessary
        
        // Then
        XCTAssertEqual(viewModel.loaderState, .error(expectedError))
        XCTAssertEqual(viewModel.items, [])
        XCTAssertEqual(viewModel.averageCost, "0.00 - 0.00")
    }
    
    
}
