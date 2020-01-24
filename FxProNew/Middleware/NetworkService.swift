//
//  AccountManager.swift
//  FxProNew
//
//  Created by admin on 21/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import Alamofire

class NetworkService {
    
    let BASE_URL = "https://api-dev.brn.ai/api/customer/"
    
    private let headers: HTTPHeaders = [
        "X-Access-Token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbnRpdHkiOiJib3QiLCJib3RfaWQiOiJNTlZaTTI2NUNIIiwiaWF0IjoxNTc2MTUwODYxfQ.781EybN7FaYATSGlQwCucocbnFLhaKdqyamb7MAhmho"
    ]
    
    func login(login: String, password: String, completion: @escaping (BaseResponse?, Error?) -> ()) {
        let parameters: [String: String] = [
            "login": login,
            "password": password
        ]
        
        request(
            BASE_URL + "login",
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: headers
        )
        .validate(contentType: ["application/json"])
        .responseString { response in
            switch response.result {
            case .success:
                guard let response = response.value else {
                    completion(nil, ResponseError.EmptyResponseError)
                    return
                }
                guard let loginResponse = LoginResponse(JSONString: response) else {
                    completion(nil, ResponseError.JSONParsingError)
                    return
                }
                guard loginResponse.error == nil else {
                    completion(nil, ResponseError.Custom(description: loginResponse.error!))
                    return
                }
                completion(loginResponse, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
}

enum ResponseError: LocalizedError {
    
    case JSONParsingError
    case EmptyResponseError
    case Custom(description: String)
    
    var localizedDescription: String {
        switch self {
        case .JSONParsingError: return "Could not parse JSON to provided model"
        case .EmptyResponseError: return "The response body is empty"
        case let .Custom(description): return description
        }
    }
}
