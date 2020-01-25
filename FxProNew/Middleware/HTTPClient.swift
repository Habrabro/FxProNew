//
//  HTTPClient.swift
//  FxProNew
//
//  Created by admin on 24/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class HTTPClient {
    
    enum ContentTypes: String {
        case applicationJSON = "application/json"
        case textHtml = "text/html; charset=utf-8"
        case multipartFormData = "multipart/form-data"
    }
    
    enum Encodings {
        case JSON
        case URL
        
        var encoding: ParameterEncoding {
            switch self {
            case .JSON: return JSONEncoding.default
            case .URL: return URLEncoding.default
            }
        }
    }
    
    var baseURL: String
    var baseHeaders: [String: String] = [
        "X-Access-Token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbnRpdHkiOiJib3QiLCJib3RfaWQiOiJNTlZaTTI2NUNIIiwiaWF0IjoxNTc2MTUwODYxfQ.781EybN7FaYATSGlQwCucocbnFLhaKdqyamb7MAhmho"
    ]
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func request<T: BaseResponse>(_ path: String, method: HTTPMethod, parameters: [String: String], encoding: Encodings, headers: [String: String] = [:], responseContentType: [ContentTypes], completion: @escaping (T?, BaseError?) -> ()) {
        guard let _ = NetworkReachabilityManager()?.isReachable else {
            completion(nil, .noInternetConnection)
            return
        }
        
        var mergedHeaders: [String: String] = baseHeaders
        headers.forEach { header in mergedHeaders[header.key] = header.value }
        
        Alamofire.request(baseURL + path, method: method, parameters: parameters, encoding: encoding.encoding, headers: mergedHeaders)
        .validate(contentType: responseContentType.map { $0.rawValue })
        .responseString { rawResponse in
            guard let response = rawResponse.value else {
                completion(nil, .emptyResponseBody)
                return
            }
            switch rawResponse.result {
            case .success:
                switch rawResponse.response!.statusCode {
                case 200..<300:
                    guard let responseModel = T(JSONString: response) else {
                        completion(nil, BaseError.JSONParseError)
                        return
                    }
                    completion(responseModel, nil)
                default:
                    let error = BaseError(JSONString: response, statusCode: rawResponse.response!.statusCode)
                    completion(nil, error)
                }
            case .failure:
                completion(nil, .invalidResponseContentType)
            }
        }
    }
    
}
