# Unit Tests README


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
