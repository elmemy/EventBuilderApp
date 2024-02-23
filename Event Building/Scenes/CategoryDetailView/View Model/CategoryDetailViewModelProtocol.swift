//
//  CategoryDetailViewModelProtocol.swift
//  Event Building
//
//  Created by elmemy on 23/02/2024.
//

import Foundation

protocol CategoryDetailViewModelProtocol: ObservableObject {
    var items: [EventItem] { get }
    var addedItems: [EventItem] { get }
    var averageCost: String { get }
    var loaderState: LoaderState { get }
    
    func fetchItems(for category: CategoryModel) async
    func addItem(_ item: EventItem)
}
