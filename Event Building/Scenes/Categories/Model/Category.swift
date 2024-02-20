//
//  Category.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

// MARK: - Domain

import SwiftUI

// Model for representing a category
struct CategoryModel: Identifiable, Codable, Equatable {
    var id: Int
    var title: String
    var image: String
}
