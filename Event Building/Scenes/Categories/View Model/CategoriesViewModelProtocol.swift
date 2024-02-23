//
//  CategoriesViewModelProtocol.swift
//  Event Building
//
//  Created by elmemy on 23/02/2024.
//

import Foundation

protocol CategoriesViewModelProtocol: ObservableObject {
    var categories: [CategoryModel] { get }
    var loaderState: LoaderState { get }
    
    func fetchCategories()
}
