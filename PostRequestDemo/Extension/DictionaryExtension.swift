//
//  DictionaryExtension.swift
//  PostRequestDemo
//
//  Created by 刘翔 on 2025/1/9.
//

import Foundation

extension Dictionary {
    func dictionaryToJson() -> String? {
        if let data = try? JSONSerialization.data(withJSONObject: self, options: []) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}
