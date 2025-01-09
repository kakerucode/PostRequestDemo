//
//  EndPoint.swift
//  PostRequestDemo
//
//  Created by 刘翔 on 2025/1/9.
//

import Foundation

enum EndPoint: String {
    case sendVerifyCode = "/auth/v3.1/user/sendVerifiyCode"
    
    static let baseHost: String = "http://139.196.169.216:10018"

    var path: URL? {
        guard let baseURL: URL = URL(string: EndPoint.baseHost) else {
            fatalError("Can not set up base url.")
        }
        return baseURL.appending(path: self.rawValue)
    }
}
