//
//  ContentViewModel.swift
//  PostRequestDemo
//
//  Created by 刘翔 on 2025/1/9.
//

import Foundation

@Observable
class ContentViewModel {
    
    private let requestSender: RequestSending = RequestSender()
    var responseString: String?
    
    @MainActor
    func sendVerfyCode() async {
        let request: VerifyCodeRequest = .init(type: "text", mobile: "5512345678")
        do {
            responseString = try await requestSender.postData(from: request)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
