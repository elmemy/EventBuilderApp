
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
Certainly! Here's how you could explain the adherence to SOLID principles in the README file:

## Adherence to SOLID Principles

The project adheres to the SOLID principles of object-oriented design, ensuring a robust and maintainable codebase:

### Single Responsibility Principle (SRP)

Each class within the codebase is designed to have a single responsibility. For example:

- The `CategoriesService` class is responsible for fetching categories from the network.
- The `ViewModel` class handles the presentation logic and state management for views.

### Open/Closed Principle (OCP)

Classes are designed to be open for extension but closed for modification. This allows for easy addition of new features without altering existing code. For instance:

- New functionalities can be added to the `ViewModel` class by subclassing or implementing protocols without modifying its core implementation.

### Liskov Substitution Principle (LSP)

Subtypes are designed to be substitutable for their base types, enabling polymorphic behavior and flexibility. For example:

- Any subclass of the `Category` class can be used interchangeably with the base `Category` class.

### Interface Segregation Principle (ISP)

Interfaces are segregated to define specific contracts, promoting loose coupling and modularity. For example:

- The `CategoriesServiceProtocol` defines a specific contract for fetching categories, ensuring that implementing classes only need to provide the required functionality.

### Dependency Inversion Principle (DIP)

High-level modules depend on abstractions, not concrete implementations, facilitating easier testing and flexibility. For example:

- The `ViewModel` class depends on abstractions such as the `CategoriesServiceProtocol`, allowing different implementations of the service to be injected at runtime.

By following these SOLID principles, the project maintains a clean, modular, and extensible architecture, making it easier to understand, maintain, and extend over time.

--- 

### Dependency Injection

Dependency injection is a design pattern used in the project to enhance flexibility, modularity, and testability by decoupling components and their dependencies. In this project:

- **CategoriesService** and **ItemsService** classes utilize dependency injection by accepting a network service (`NetworkServiceProtocol`) as a parameter in their constructors.
  
  ```swift
  init(networkService: NetworkServiceProtocol) {
      self.networkService = networkService
  }
  ```

- This approach allows different implementations of the network service to be injected into the services, facilitating easier testing and flexibility. For example, mock implementations of the network service can be injected during unit tests to isolate the services from external dependencies.

- By adhering to the dependency injection principle, the project promotes loose coupling between components, making it easier to replace or mock dependencies when needed.

- Overall, dependency injection enhances the maintainability and testability of the project by making component dependencies explicit and easily substitutable.


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

