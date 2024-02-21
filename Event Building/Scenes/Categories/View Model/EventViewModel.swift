//
//  EventViewModel.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//
// EventViewModel.swift

import SwiftUI
import Combine

class EventViewModel: ObservableObject {
    @Published var categories: [CategoryModel] = []
    @Published var items: [EventItem] = []
    @Published var addedItems: [EventItem] = []
    @Published var averageCost: String = "0.00"

    private let eventService: EventService

    init(eventService: EventService) {
        self.eventService = eventService
    }

    func fetchCategories() async {
        do {
            let categories = try await eventService.fetchCategories()
            DispatchQueue.main.async {
                self.categories = categories
            }
        } catch {
            print("Error fetching categories: \(error)")
        }
    }

    func fetchItems(for category: CategoryModel) async {
        do {
            let items = try await eventService.fetchItems(for: category)
            DispatchQueue.main.async {
                self.items = items
            }
        } catch {
            print("Error fetching items for \(category.title): \(error)")
        }
    }

    func addItem(_ item: EventItem) {
        if !addedItems.contains(where: { $0.id == item.id }) {
            addedItems.append(item)
            updateItemStatus()
            updateAverageCost()
        }
    }

    func updateItemStatus() {
        for var item in items {
            item.isAdded = addedItems.contains { $0.id == item.id }
        }
    }

    func updateAverageCost() {
        let (minCost, maxCost, _) = calculateMinMaxAverageCost()
        self.averageCost = "$\(minCost) - \(maxCost)"
    }

    private func calculateMinMaxAverageCost() -> (min: String, max: String, average: String) {
        guard !addedItems.isEmpty else {
            return ("0.00", "0.00", "0.00")
        }

        let (minCost, maxCost) = calculateMinMax(addedItems: addedItems)

        if let minDouble = Double(minCost), let maxDouble = Double(maxCost) {
            let totalCost = (minDouble + maxDouble) / 2.0
            let formattedAverageCost = String(format: "%.2f", totalCost)

            return (min: minCost, max: maxCost, average: formattedAverageCost)
        } else {
            return ("0.00", "0.00", "0.00")
        }
    }

    private func calculateMinMax(addedItems: [EventItem]) -> (min: String, max: String) {
        let minCost = addedItems.min(by: { $0.avgBudget < $1.avgBudget })?.avgBudget ?? 0.0
        let maxCost = addedItems.max(by: { $0.avgBudget < $1.avgBudget })?.avgBudget ?? 0.0

        return (min: String(format: "%.2f", minCost), max: String(format: "%.2f", maxCost))
    }
}
