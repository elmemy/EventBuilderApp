
# Event Building App

This repository contains the source code for an Event Building application built in Swift. The application follows best practices in software engineering, including adherence to SOLID principles, separation of concerns, dependency injection, and modular architecture.

## Overview

The Event Building app is designed to facilitate the organization of events by providing features for managing categories and items within those categories. Users can view categories, fetch items associated with each category, and add items to their event planning list.

## Key Components

### Network Layer

The network layer is responsible for handling network requests. It includes a `NetworkService` class that abstracts away the details of making HTTP requests using URLSession and Moya. This layer ensures a consistent interface for performing network operations across the application.

### Domain Layer

The domain layer contains the business logic of the application. It includes services for fetching categories and items from the network. The `CategoriesService` and `ItemsService` classes implement protocols (`CategoriesServiceProtocol` and `ItemsServiceProtocol`, respectively) to provide a clear contract for fetching data.

### Presentation Layer

The presentation layer handles user interaction and display logic. It includes view models (`CategoriesViewModel` and `CategoryDetailViewModel`) that expose data and state for use by the user interface. These view models interact with the domain layer to fetch data and update the UI accordingly.

## SOLID Principles

The codebase adheres to SOLID principles:

- **Single Responsibility Principle**: Each class has a single responsibility, such as fetching categories or managing item data.
- **Open/Closed Principle**: Classes are open for extension but closed for modification, allowing for easy addition of new features without modifying existing code.
- **Liskov Substitution Principle**: Subtypes can be substituted for their base types, enabling polymorphic behavior and flexibility.
- **Interface Segregation Principle**: Interfaces are segregated to define specific contracts, promoting loose coupling and modularity.
- **Dependency Inversion Principle**: High-level modules depend on abstractions, not concrete implementations, facilitating easier testing and flexibility.


// Single Responsibility Principle (SRP): Each class has a single responsibility.

// Example:
// The CategoriesService class is responsible for fetching categories from the network.
class CategoriesService {
    // Fetches categories from the network.
    func fetchCategories() { ... }
}

// Open/Closed Principle (OCP): Classes are open for extension but closed for modification.

// Example:
// The ViewModel class is open for extension through subclassing or protocol conformance.
// Adding new features can be achieved without modifying the existing ViewModel class.
class ViewModel {
    // Common properties and methods.
}

// Liskov Substitution Principle (LSP): Subtypes can be substituted for their base types.

// Example:
// Any subclass of the Category class can be used interchangeably with the base Category class.
class Category { ... }

// Interface Segregation Principle (ISP): Interfaces are segregated to define specific contracts.

// Example:
// The CategoriesServiceProtocol defines a specific contract for fetching categories.
protocol CategoriesServiceProtocol {
    func fetchCategories()
}

// Dependency Inversion Principle (DIP): High-level modules depend on abstractions, not concrete implementations.

// Example:
// The ViewModel class depends on the CategoriesServiceProtocol abstraction rather than a concrete CategoriesService implementation.
class ViewModel {
    let service: CategoriesServiceProtocol
    init(service: CategoriesServiceProtocol) {
        self.service = service
    }
}

## Getting Started

To run the Event Building app:

1. Clone this repository to your local machine.
2. Open the project in Xcode.
3. Build and run the app on a simulator or device.

## Dependencies

The project uses the following dependencies:

- **Moya**: A network abstraction layer built on top of Alamofire for easier network request handling.
- **Combine**: A framework for processing values over time, used for asynchronous programming and handling data streams.

Certainly! Here's how you might explain the unit tests in the README file:

---

## Unit Tests

The project includes comprehensive unit tests to verify the behavior of the view models: `CategoriesViewModel` and `CategoryDetailViewModel`. These tests use XCTest, the native testing framework for Swift, and XCTestExpectation for asynchronous testing.

### `CategoriesViewModelTests`

1. **`testFetchCategories_Success`**: This test validates the `CategoriesViewModel` behavior when categories are successfully fetched. It sets up a mock `CategoriesService` to return expected categories and ensures that the view model correctly transitions through loading states and updates its state with the fetched categories.

2. **`testFetchCategories_Failure`**: This test verifies the handling of category fetching failures by the `CategoriesViewModel`. It configures the mock `CategoriesService` to simulate a failure scenario and checks that the view model properly handles the error state and maintains the categories as `nil`.

### `CategoryDetailViewModelTests`

1. **`testFetchItems_Success`**: Similar to the categories test, this test assesses the `CategoryDetailViewModel` behavior when items are successfully fetched. It uses a mock `ItemsService` to provide expected items and confirms that the view model correctly updates its state upon successful fetching.

2. **`testFetchItems_Failure`**: This test examines the `CategoryDetailViewModel` response to item fetching failures. It configures the mock `ItemsService` to produce a failure result, ensuring that the view model appropriately handles the error state and maintains the items as empty, with an average cost of "0.00 - 0.00".

### Mock Objects

- **`CategoriesServiceProtocolMock`**: This mock object mimics the behavior of the `CategoriesServiceProtocol` to facilitate controlled testing of category fetching operations.

- **`ItemsServiceProtocolMock`**: Similarly, this mock object replicates the behavior of the `ItemsServiceProtocol` for testing item fetching scenarios.

These unit tests serve as a crucial component of the development process, ensuring the correctness and reliability of the view models' behavior under various conditions. By thoroughly testing both success and failure paths, the project maintains a high level of quality and robustness.

