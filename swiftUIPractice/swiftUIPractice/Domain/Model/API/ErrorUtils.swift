//
//  ErrorUtils.swift
//  swiftUIPractice
//
//  Created by Carolina Calderon on 31/3/25.
//

import Foundation
enum CustomErrorAPI: Error {
    case networkError(String, code: Int)
    case validationError(String, code: Int)
    case serverError(String, code: Int)
    case unknownError(String, code: Int)
}

enum ErrorsCodes: Int {
    case network = 1
    case unknown = 2
    case illegal = 3
    
    static func fromCode(code: Int) -> ErrorsCodes? {
        return ErrorsCodes(rawValue: code)
    }
}

class ErrorUtils {
    static func handleException(exception: Error) -> ApiResult<Never> {
        let customError: CustomErrorAPI
        
        switch exception {
        case let error as NSError where error.domain == NSURLErrorDomain:
            customError = .networkError("Network error occurred: \(error.localizedDescription)", code: ErrorsCodes.network.rawValue)
        case let error as NSError where error.domain == NSCocoaErrorDomain:
            customError = .validationError("Validation error: \(error.localizedDescription)", code: ErrorsCodes.illegal.rawValue)
        default:
            customError = .unknownError("An unknown error occurred: \(exception.localizedDescription)", code: ErrorsCodes.unknown.rawValue)
        }

        return .error(customError)
    }
}
