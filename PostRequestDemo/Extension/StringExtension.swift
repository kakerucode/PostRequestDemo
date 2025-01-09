//
//  StringExtension.swift
//  PostRequestDemo
//
//  Created by 刘翔 on 2025/1/9.
//

import Foundation
import CryptoSwift

extension String {
    func encryptAES(withKey key: String) -> String {
        do {
            if let encryptData = data(using: .utf8),
               let iv = String(bytes: key.bytes.prefix(16), encoding: .utf8) {
                let aes = try AES(key: key, iv: iv)
                let encrypted = try aes.encrypt(encryptData.bytes)
                return encrypted.toBase64()
            }
        } catch {
            return ""
        }
        return ""
    }

    func decryptAES(withKey key: String) -> String {
        do {
            if let encryptData = Data(base64Encoded: self),
                let iv = String(bytes: key.bytes.prefix(16), encoding: .utf8) {
                
                let aes = try AES(key: key, iv: iv)
                let decrypted = try aes.decrypt(encryptData.bytes)
                debugPrint("Decrypted bytes: \(decrypted)")
                return String(bytes: decrypted, encoding: .utf8) ?? ""
            }
        } catch {
            debugPrint(error.localizedDescription)
            return ""
        }
        return self
    }
}
