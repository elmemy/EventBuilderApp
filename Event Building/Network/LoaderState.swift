//
//  LoaderState.swift
//  Event Building
//
//  Created by elmemy on 23/02/2024.
//

enum LoaderState: Equatable {
    case idle
    case loading
    case loaded
    case error(Error)

    static func == (lhs: LoaderState, rhs: LoaderState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading), (.loaded, .loaded):
            return true
        case let (.error(lhsError), .error(rhsError)):
            // Compare errors if necessary, or simply return true
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
