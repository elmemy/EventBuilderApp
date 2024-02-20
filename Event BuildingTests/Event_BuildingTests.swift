//
//  Event_BuildingTests.swift
//  Event BuildingTests
//
//  Created by elmemy on 19/02/2024.

import XCTest
@testable import Event_Building

class EventViewModelTests: XCTestCase {
    // Mock implementation of Networking protocol
    class MockNetworking: Networking {
        var fetchDataResult: Result<Data, Error> = .success(Data())

        func fetchData<T: Decodable>(from url: URL) async throws -> T {
            switch fetchDataResult {
            case let .success(data):
                return try JSONDecoder().decode(T.self, from: data)
            case let .failure(error):
                throw error
            }
        }
    }

    var mockNetworking: MockNetworking!
    var eventService: EventService!
    var eventViewModel: EventViewModel!

    override func setUp() {
        super.setUp()
        mockNetworking = MockNetworking()
        eventService = EventService(networking: mockNetworking)
        eventViewModel = EventViewModel(eventService: eventService)
    }

    override func tearDown() {
        mockNetworking = nil
        eventService = nil
        eventViewModel = nil
        super.tearDown()
    }

    // MARK: - Tests

    // Test fetching categories succeeds when the network call is successful
    func testFetchCategoriesSuccess() async {
        let expectedCategories = [CategoryModel(id: 1, title: "Category 1", image: "image1")]
        mockNetworking.fetchDataResult = .success(try! JSONEncoder().encode(expectedCategories))

        await eventViewModel.fetchCategories()

        let expectation = XCTestExpectation(description: "Categories fetched successfully")
        
        DispatchQueue.main.async {
            XCTAssertEqual(self.eventViewModel.categories, expectedCategories)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)  // Adjust the timeout as needed
    }

    // Test fetching categories fails when the network call encounters an error
    func testFetchCategoriesFailure() async {
        mockNetworking.fetchDataResult = .failure(NetworkError.requestFailed(NSError(domain: "Test", code: 0, userInfo: nil)))

        await eventViewModel.fetchCategories()

        let expectation = XCTestExpectation(description: "Categories fetch should fail")
        
        DispatchQueue.main.async {
            XCTAssertTrue(self.eventViewModel.categories.isEmpty)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)  // Adjust the timeout as needed
    }

    // Test adding an item to the ViewModel
    func testAddItem() {
        let item = EventItem(id: 1, title: "Item 1", minBudget: 10.0, maxBudget: 20.0, avgBudget: 15.0, image: "itemImage")

        eventViewModel.addItem(item)

        XCTAssertTrue(eventViewModel.addedItems.contains(item))
    }

    // Test updating the average cost after adding an item
    func testUpdateAverageCost() {
        let item = EventItem(id: 1, title: "Item 1", minBudget: 10.0, maxBudget: 20.0, avgBudget: 15.0, image: "itemImage")
        eventViewModel.addItem(item)

        eventViewModel.updateAverageCost()

        XCTAssertEqual(eventViewModel.averageCost, "$15.00 - 15.00")
    }
}
