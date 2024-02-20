//
//  EventService.swift
//  Event Building
//
//  Created by elmemy on 20/02/2024.
//


// Service for fetching categories and items
class EventService: EventServiceInjectable {
    let networking: Networking

    init(networking: Networking) {
        self.networking = networking
    }

    // Fetch categories asynchronously
    func fetchCategories() async throws -> [CategoryModel] {
        return try await networking.fetchData(from: APIConstants.categoriesURL())
    }

    // Fetch items for a specific category asynchronously
    func fetchItems(for category: CategoryModel) async throws -> [EventItem] {
        return try await networking.fetchData(from: APIConstants.itemsURL(for: category.id))
    }

    // Implementing the protocol's requirement
    var eventService: EventService {
        return self
    }
}
