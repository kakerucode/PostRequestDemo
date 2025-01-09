//
//  Request.swift
//  PostRequestDemo
//
//  Created by 刘翔 on 2025/1/9.
//

import Foundation
import CryptoSwift

protocol Request {
    var endPoint: EndPoint { get }
    var httpMethod: HTTPMethod { get }
    var queryItems: [String: Any]? { get }
    var header: [String: String]? { set get }
    var body: [String: Any]? { get }
}

extension Request {
    var httpMethod: HTTPMethod {
        .post
    }
    var queryItems: [String: Any]? {
        nil
    }
    var header: [String: String]? {
        get {
            commonHeader
        }
        set {
            header = newValue
        }
    }
}

private var commonHeader: [String: String] {
    let token: [String: String] = [
        "sourceChannel": "",
        "packageName": CryptoToken.packageName.rawValue,
        "version": Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "",
        "adid": "",
        "idfa": "",
        "idfv": "",
        "userId": "",
        "uuId": "",
    ]
    let tokenJson = token.dictionaryToJson() ?? ""
    let tokenAESString = tokenJson.encryptAES(withKey: CryptoToken.tokenKey.rawValue) //替换tokenKey

    // headers
    let headers: [String: String] = [
        "packageName": CryptoToken.alias.rawValue, //替换alias
        CryptoToken.headName.rawValue: tokenAESString,  //替换headName
        ]
    return headers
}
