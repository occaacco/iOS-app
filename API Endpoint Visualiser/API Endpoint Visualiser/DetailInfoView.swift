//
//  DetailInfoView.swift
//  API Endpoint Visualiser
//
//  Created by Samuel Benko on 2023. 12. 05..
//

// DetailInfoView.swift

import SwiftUI

struct DetailInfoView: View {
    let title: String
    let content: String

    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding()

            Text(content)
                .foregroundColor(.blue)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("\(title) Detail")
    }
}

