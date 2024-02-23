//
//  Event_BuildingTests.swift
//  Event BuildingTests
//
//  Created by elmemy on 19/02/2024.

import XCTest
import Combine
@testable import Event_Building

class CategoriesViewModelTests: XCTestCase {
    
    var viewModel: CategoriesViewModel!
    var categoriesServiceMock: CategoriesServiceProtocolMock!
    
    override func setUp() {
        super.setUp()
        categoriesServiceMock = CategoriesServiceProtocolMock()
        viewModel = CategoriesViewModel(categoriesService: categoriesServiceMock)
    }
    
    override func tearDown() {
        viewModel = nil
        categoriesServiceMock = nil
        super.tearDown()
    }
    
    func testFetchCategories_Success() async {
        // Given
        // Ensure categories are initially nil
        XCTAssertNil(viewModel.categories)
        
        let expectedCategories = [CategoryModel(id: 1, title: "Category 1", image: "image1")]
        categoriesServiceMock.fetchCategoriesResult = Just(expectedCategories)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
        
        // When
        await viewModel.fetchCategories()
        
        // Then
        XCTAssertEqual(viewModel.loaderState, .loading)
        
        do {
            // Simulate asynchronous fetch by waiting for a short duration
            try await Task.sleep(nanoseconds: 10 * 1_000_000_000) // Wait for 10 second
            
            // Check the loader state and categories after the asynchronous operation completes
            XCTAssertEqual(viewModel.loaderState, .loaded) // Ensure loader state is updated to loaded
            XCTAssertEqual(viewModel.categories, expectedCategories)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }

    
    func testFetchCategories_Failure() async {
        // Given
        let expectedError = NetworkError.unknown
        categoriesServiceMock.fetchCategoriesResult = Fail(error: expectedError)
            .eraseToAnyPublisher()
        
        // When
        await viewModel.fetchCategories()
        
        // Then
        XCTAssertEqual(viewModel.loaderState, .loading)
        XCTAssertEqual(viewModel.categories, nil)
        
        // Simulate asynchronous fetch
        do {
            // Use await to wait for the asynchronous operation to complete
            try await Task.sleep(nanoseconds: 1 * 1_000_000_000) // Wait for 1 second
            
            // Ensure that the loader state and categories are updated correctly after the asynchronous operation
            XCTAssertEqual(viewModel.loaderState, .error(expectedError))
            XCTAssertEqual(viewModel.categories, nil)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
}
