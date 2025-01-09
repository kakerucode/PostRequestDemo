//
//  Token.swift
//  PostRequestDemo
//
//  Created by 刘翔 on 2025/1/9.
//

import Foundation

struct RequestToken: Encodable {
    let sourceChannel: String = ""
    let packageName: String = Bundle.main.bundleIdentifier ?? ""
    let version: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    let adid: String = ""
    let idfa: String = ""
    let idfv: String = ""
    let userId: String = ""
    let uuId: String = ""
}
