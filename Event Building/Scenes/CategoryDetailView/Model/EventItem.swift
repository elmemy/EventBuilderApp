//
//  Event.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

// MARK: - Event Item Model

// Model for representing an event item
struct EventItem: Identifiable, Decodable, Equatable {
    let id: Int
    let title: String
    let minBudget: Double
    let maxBudget: Double
    let avgBudget: Double
    let image: String
    var isAdded: Bool? = false
}
