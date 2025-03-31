//
//  ApiResult.swift
//  swiftUIPractice
//
//  Created by Carolina Calderon on 31/3/25.
//

import Foundation

enum ApiResult<T> {
    case success(T)
    case loading(Bool)
    case error(Error)
    case errorGeneric(data: T?, exception: String)
}

protocol CustomError: Error {
    var message: String { get }
    var code: Int { get }
}

struct NetworkError: CustomError {
    let message: String
    let code: Int
}

struct ServerError: CustomError {
    let message: String
    let code: Int
}

struct ValidationError: CustomError {
    let message: String
    let code: Int
}

struct UnknownError: CustomError {
    let message: String
    let code: Int
}
