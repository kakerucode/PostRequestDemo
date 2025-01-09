//
//  ContentView.swift
//  PostRequestDemo
//
//  Created by 刘翔 on 2025/1/9.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: ContentViewModel = .init()
    
    var body: some View {
        VStack {
        
            Text(viewModel.responseString ?? "")
                .bold()
        }
        .padding()
        .task {
            await viewModel.sendVerfyCode()
        }
    }
}

#Preview {
    ContentView()
}
