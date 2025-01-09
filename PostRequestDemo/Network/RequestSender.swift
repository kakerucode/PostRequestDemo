//
//  RequestSender.swift
//  PostRequestDemo
//
//  Created by 刘翔 on 2025/1/9.
//

import CryptoSwift
import Foundation

enum CryptoToken: String {
    case packageName = "com.mexico.universal"
    case apiKey = "Uh5EzhZoHtUpqSAB"
    case tokenKey = "uxgfzPDMcK35Bwr2V8o0lYe6RKbYQxvt"
    case encryptName = "SLGPRUTO"
    case headName = "JOGGHXW"
    case alias = "wuniversal"
}

struct RequestSender: RequestSending {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func postData(from request: Request) async throws -> String {
        
        do {
            guard let url: URL = request.endPoint.path else {
                throw NetworkError.requestMissed
            }
            debugPrint(url)
            var urlRequest: URLRequest = .init(url: url)
            urlRequest.allHTTPHeaderFields = request.header
            urlRequest.httpMethod = request.httpMethod.rawValue
                
            if let parameters = request.body {
                let paramsJson: String = parameters.dictionaryToJson() ?? ""
                let paramsAESString: String = paramsJson.encryptAES(withKey: CryptoToken.apiKey.rawValue)  //替换apiKey
                var params: [String: String] = [:]
                params[CryptoToken.encryptName.rawValue] = paramsAESString
                let data: Data? = try JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = data
            }
            let (data, urlResponse) = try await session.data(for: urlRequest)
            if let httpResponse: HTTPURLResponse = urlResponse as? HTTPURLResponse, httpResponse.statusCode == 200 {
                
                // response
                if let jsonString = String(data: data, encoding: .utf8) {
                    debugPrint(jsonString)
                    let decryptString = jsonString.decryptAES(withKey: CryptoToken.apiKey.rawValue) //替换apiKey
                    return decryptString
                }
                return ""
            } else {
                throw NetworkError.requestError
            }
        } catch let error {
            throw error
        }
    }
}

