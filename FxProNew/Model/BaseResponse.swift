//
//  BaseResponse.swift
//  FxProNew
//
//  Created by admin on 23/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse: Mappable {
    
    var status: Bool?
    var error: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        status <- map["status"]
        error  <- map["error"]
    }
    
}
