//
//  RequestSending.swift
//  PostRequestDemo
//
//  Created by 刘翔 on 2025/1/9.
//

import Foundation

protocol RequestSending {
    func postData(from request: Request) async throws -> String
}
