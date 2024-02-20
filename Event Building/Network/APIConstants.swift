//
//  ServiceConfig.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

// MARK: - API Constants

import Foundation

// Struct to hold API-related constants
struct APIConstants {
    static let baseURL = "https://firebasestorage.googleapis.com/v0/b/api-project-135344502626.appspot.com/o/"

    // Function to generate URL for fetching categories
    static func categoriesURL() -> URL {
        return URL(string: "\(baseURL)categories.json?alt=media")!
    }

    // Function to generate URL for fetching items based on category ID
    static func itemsURL(for categoryID: Int) -> URL {
        return URL(string: "\(baseURL)\(categoryID).json?alt=media")!
    }
}
