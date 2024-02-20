# EventBuilderApp

# Event Builder App

This repository contains the source code for an iOS application named "Event Builder." The app is designed to help users plan and estimate the cost of organizing events by providing a categorized list of items along with their respective budgets. Users can add items to their event, view the estimated cost, and save the event for future reference.

## Networking

The networking functionality is encapsulated in the `NetworkLayer` struct, which conforms to the `Networking` protocol. The app uses asynchronous Swift functions to fetch data from a remote API. The `APIConstants` struct holds the base URL and provides methods to generate specific URLs for fetching categories and items.

## Models

The app defines two main models:
- `CategoryModel`: Represents a category with an identifier, title, and image.
- `EventItem`: Represents an event item with an identifier, title, minimum budget, maximum budget, average budget, image, and an optional flag indicating whether the item has been added to the event.

## ViewModels

The `EventViewModel` class is responsible for managing the application's data flow and business logic. It utilizes Combine to handle asynchronous tasks and provides methods for fetching categories and items, adding items to the event, and calculating average costs.

## Views

The app includes several SwiftUI views for presenting the user interface:
- `ContentView`: The main view displaying the app's title, description, and a list of event categories.
- `CategoryItemView`: Represents a category item in the category list.
- `EventCategoriesView`: Displays a scrollable grid of event categories.
- `ItemView`: Represents an event item with an image, title, and budget range.
- `CategoryDetailView`: Displays details of a specific category, including the average cost and a list of items.
- `ResultView`: Shown after saving an event, providing feedback on a successful event save along with the average cost.


# Event Building App

This repository contains the source code for the Event Building app. The app allows users to manage and view different event categories.

## Unit Tests

#### `testFetchCategoriesFailure`
- **Description:** Tests the scenario where fetching categories from the network results in a failure.
- **Steps:**
  1. Set up a mock networking class (`MockNetworking`) to simulate network responses.
  2. Configure the mock to return a failure result with a predefined error.
  3. Invoke the `fetchCategories` method on the `EventViewModel` asynchronously.
  4. Assert that the `categories` array in the view model is empty after the operation.

#### `testAddItem`
- **Description:** Tests the addition of an item to the `EventViewModel`.
- **Steps:**
  1. Create an instance of `EventItem`.
  2. Invoke the `addItem` method on the `EventViewModel` with the created item.
  3. Assert that the added item is present in the `addedItems` array of the view model.

### MockNetworking
- **Description:** A mock implementation of the `Networking` protocol for testing purposes.
- **Properties:**
  - `fetchDataResult`: Result to be returned when `fetchData` is called.
- **Methods:**
  - `fetchData<T: Decodable>(from url: URL) async throws -> T`: Simulates fetching data from the network.

## How to Run Tests

To run the unit tests, follow these steps:

1. Open the Xcode project for the Event Building app.
2. Navigate to the `Event BuildingTests` target.
3. Press `Cmd + U` or choose "Product" > "Test" from the Xcode menu.


## Dependencies

The app relies on Combine for reactive programming and SwiftUI for building the user interface. The networking layer utilizes the `URLSession` for asynchronous data fetching, and the `JSONDecoder` for decoding JSON responses.

Feel free to explore, modify, and build upon this codebase for your event planning application. If you encounter any issues or have suggestions, please don't hesitate to reach out or contribute to the repository. Happy coding!
