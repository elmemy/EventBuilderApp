//
//  CategoriesViewModel.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//
// CategoriesViewModel.swift

import Foundation
import Combine

class CategoriesViewModel: ObservableObject{

    @Published var items: [EventItem] = []
    @Published var addedItems: [EventItem] = []
    @Published var averageCost: String = ""
    @Published var loaderState: LoaderState = .idle
    
    // Optional properties
    @Published var categories: [CategoryModel]? = nil

    private let categoriesService: CategoriesServiceProtocol
    private var cancellables: Set<AnyCancellable> = []

    init(categoriesService: CategoriesServiceProtocol) {
        self.categoriesService = categoriesService
    }

    func fetchCategories() async {
        if (loaderState == .loaded) {return}
        loaderState = .loading
        categoriesService.fetchCategories()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.loaderState = .loaded
                case .failure(let error):
                    self?.loaderState = .error(error)
                }
            } receiveValue: { [weak self] categories in
                self?.categories = categories
            }
            .store(in: &cancellables)
    }
    
  
    
}
