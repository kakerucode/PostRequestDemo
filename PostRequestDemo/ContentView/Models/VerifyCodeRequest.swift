//
//  VerifyCodeRequest.swift
//  PostRequestDemo
//
//  Created by 刘翔 on 2025/1/9.
//

import Foundation

struct VerifyCodeRequest: Request {
    let type: String
    let mobile: String
    
    var endPoint: EndPoint = .sendVerifyCode
    
    var body: [String : Any]? {
        [
            "type": type,
            "mobile": mobile
        ]
    }
}
