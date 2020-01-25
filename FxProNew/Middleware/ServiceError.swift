//
//  ServiceError.swift
//  FxProNew
//
//  Created by admin on 25/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import ObjectMapper

class ServiceError: Mappable {
    
    var description: String?
    
    required init?(map: Map) {}
    
    // Mappable
    func mapping(map: Map) {
        description <- map["error"]
    }
    
}
