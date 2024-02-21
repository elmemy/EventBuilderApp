//
//  EventService.swift
//  Event Building
//
//  Created by elmemy on 20/02/2024.
//

// EventService.swift

class EventService: EventServiceInjectable {
    let networking: Networking

    init(networking: Networking) {
        self.networking = networking
    }

    func fetchCategories() async throws -> [CategoryModel] {
        return try await networking.fetchData(from: APIConstants.categoriesURL())
    }

    func fetchItems(for category: CategoryModel) async throws -> [EventItem] {
        return try await networking.fetchData(from: APIConstants.itemsURL(for: category.id))
    }

    var eventService: EventService {
        return self
    }
}

protocol NetworkServiceInjectable {
    var networking: Networking { get }
}

class DIContainer: NetworkServiceInjectable {
    let networking: Networking = NetworkService()
}

protocol EventServiceInjectable: NetworkServiceInjectable {
    var eventService: EventService { get }
}
