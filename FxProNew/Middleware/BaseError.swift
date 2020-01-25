//
//  BaseServiceError.swift
//  FxProNew
//
//  Created by admin on 25/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import ObjectMapper

enum BaseError: Error {
    case noInternetConnection
    case badRequest(description: String?)
    case forbidden
    case notFound(description: String?)
    case internalSeverError
    case badGateway
    case emptyResponseBody
    case JSONParseError
    case invalidResponseContentType
    case custom(description: String?)
    case unknown
}

extension BaseError: LocalizedError {
    var localizedDescription: String? {
        switch self {
        case .noInternetConnection: return "Отсутствует подключение к интернету"
        case .badRequest: return "Неверный запрос"
        case .forbidden: return "Доступ запрещён"
        case .notFound: return "Пользователь не найден"
        case .internalSeverError: return "Внутренняя ошибка сервера"
        case .badGateway: return "Неверный шлюз"
        case .emptyResponseBody: return "Пустое тело ответа"
        case .JSONParseError: return "Ошибка парсинга JSON"
        case .invalidResponseContentType: return "Неверный content-type ответа"
        case let .custom(description: description): return description
        case .unknown: return "Неизвестная ошибка"
        }
    }
}

extension BaseError {
    init(JSONString: String, statusCode: Int? = nil) {
        guard let statusCode = statusCode else { self = .unknown; return }
        let serviceError = ServiceError(JSONString: JSONString)
        switch statusCode {
        case 400: self = .badRequest(description: serviceError?.description ?? "Something went wrong")
        case 403: self = .forbidden
        case 404: self = .notFound(description: serviceError?.description ?? "Something went wrong")
        case 500: self = .internalSeverError
        case 502: self = .badGateway
        default: self = .custom(description: "Status code: " + String(statusCode))
        }
    }
}
