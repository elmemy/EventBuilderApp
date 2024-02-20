//
//  DependencyInjectionNetwork.swift
//  Event Building
//
//  Created by elmemy on 20/02/2024.
//

// MARK: - Dependency Injection

// Protocol for dependency injection of network service
protocol NetworkServiceInjectable {
    var networking: Networking { get }
}

// Dependency Injection Container providing a concrete networking instance
class DIContainer: NetworkServiceInjectable {
    let networking: Networking = NetworkService()
}

// Protocol for dependency injection of event service
protocol EventServiceInjectable: NetworkServiceInjectable {
    var eventService: EventService { get }
}
