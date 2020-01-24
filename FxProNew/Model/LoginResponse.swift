//
//  LoginResponse.swift
//  FxProNew
//
//  Created by admin on 23/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse: BaseResponse {
    
    var token: String?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        token <- map["token"]
    }
    
}
