//
//  NetworkError.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

// MARK: - NetworkError

enum NetworkError: Error {
    case connectivity
    case invalidResponse
    case parsingError(Error)
    case serverError(Int, String)
    case unknown
}
