//
//  APITarget.swift
//  Event Building
//
//  Created by elmemy on 23/02/2024.
//
import Foundation
import Moya

// MARK: - APITarget

/// Enum defining the endpoints for API requests.
enum APITarget {
    case categories
    case items(categoryID: Int)
}

extension APITarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://firebasestorage.googleapis.com/v0/b/api-project-135344502626.appspot.com/o/")!
    }
    
    var path: String {
        switch self {
        case .categories:
            return baseURL.appendingPathComponent("categories.json").absoluteString + "?alt=media"
        case .items(let categoryID):
            return baseURL.appendingPathComponent("\(categoryID).json").absoluteString + "?alt=media"
        }
    }

    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return nil
    }
}
