
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

## Getting Started

To run the Event Building app:

1. Clone this repository to your local machine.
2. Open the project in Xcode.
3. Build and run the app on a simulator or device.

## Dependencies

The project uses the following dependencies:

- **Moya**: A network abstraction layer built on top of Alamofire for easier network request handling.
- **Combine**: A framework for processing values over time, used for asynchronous programming and handling data streams.

This set of test cases verifies the behavior of the view models (`CategoriesViewModel` and `CategoryDetailViewModel`) under different conditions:

### `CategoriesViewModelTests`

1. **`testFetchCategories_Success`**: This test ensures that the `CategoriesViewModel` correctly handles the scenario where categories are successfully fetched from the service. It sets up a mock `CategoriesService` to return a successful result with expected categories. After calling `fetchCategories()`, it verifies that the loader state transitions from `.loading` to `.loaded`, and that the fetched categories match the expected categories.

2. **`testFetchCategories_Failure`**: This test verifies the behavior of the `CategoriesViewModel` when category fetching fails. It configures the mock `CategoriesService` to return a failure result with an expected error. After calling `fetchCategories()`, it checks that the loader state transitions to `.error`, and that the fetched categories remain `nil`.

### `CategoryDetailViewModelTests`

1. **`testFetchItems_Success`**: Similar to the `CategoriesViewModel` test, this test checks the behavior of the `CategoryDetailViewModel` when items are successfully fetched. It sets up a mock `ItemsService` to return expected items for a given category. After calling `fetchItems(for:)`, it waits for the asynchronous operation to complete and verifies that the loader state transitions to `.loaded` and that the fetched items match the expected items.

2. **`testFetchItems_Failure`**: This test ensures that the `CategoryDetailViewModel` handles item fetching failures correctly. It configures the mock `ItemsService` to return a failure result with an expected error. After calling `fetchItems(for:)`, it waits for the asynchronous operation to complete and checks that the loader state transitions to `.error` and that the items remain empty with an average cost of "0.00 - 0.00".

### Mock Objects

- **`CategoriesServiceProtocolMock`**: This mock object implements the `CategoriesServiceProtocol` and allows controlling the behavior of category fetching for testing purposes. It tracks the number of times `fetchCategories()` is called and returns a customizable result.
  
- **`ItemsServiceProtocolMock`**: Similarly, this mock object implements the `ItemsServiceProtocol` and allows controlling the behavior of item fetching. It returns a customizable result for testing.

These tests ensure that the view models respond appropriately to different outcomes of data fetching operations, such as success and failure, and handle the loading states correctly. They help ensure the reliability and correctness of the application's behavior.
