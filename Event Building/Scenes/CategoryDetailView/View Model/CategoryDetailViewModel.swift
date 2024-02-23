//
//  CategoryDetailViewModel.swift
//  Event Building
//
//  Created by elmemy on 23/02/2024.
//

import Foundation
import Combine

class CategoryDetailViewModel: ObservableObject,CategoryDetailViewModelProtocol {
    
    @Published var items: [EventItem] = []
    @Published var addedItems: [EventItem] = []
    @Published var averageCost: String = "0.00 - 0.00"
    @Published var loaderState: LoaderState = .idle
    
    private let itemsService: ItemsServiceProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    init(itemsService: ItemsServiceProtocol) {
        self.itemsService = itemsService
    }
    
    func fetchItems(for category: CategoryModel) async{
        loaderState = .loading
        itemsService.fetchItems(for: category.id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.loaderState = .loaded
                case .failure(let error):
                    self?.loaderState = .error(error)
                }
            } receiveValue: { [weak self] items in
                self?.items = items
            }
            .store(in: &cancellables)
    }
    
    func addItem(_ item: EventItem) {
        if !addedItems.contains(where: { $0.id == item.id }) {
            addedItems.append(item)
            updateItemStatus()
            updateAverageCost()
        }
    }
    
    private func updateItemStatus() {
        for var item in items {
            item.isAdded = addedItems.contains { $0.id == item.id }
        }
    }
    
    private func updateAverageCost() {
        let (_, _, avertageCost) = calculateMinMaxAverageCost()
        averageCost = "$\(avertageCost)"
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
