//
//  DetailView.swift
//  API Endpoint Visualiser
//
//  Created by Samuel Benko on 2023. 12. 05..
//

// DetailView.swift

import SwiftUI

struct DetailView: View {
    let apiEntry: APIEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            EntryView(title: "API Name:", content: apiEntry.API, isLink: false)
            EntryView(title: "Description:", content: apiEntry.Description, isLink: false)
            EntryView(title: "Auth:", content: apiEntry.Auth, isLink: false)
            EntryView(title: "HTTPS:", content: apiEntry.HTTPS ? "Yes" : "No", isLink: false)
            EntryView(title: "Cors:", content: apiEntry.Cors, isLink: false)
            EntryView(title: "Link:", content: apiEntry.Link, isLink: true)
            EntryView(title: "Category:", content: apiEntry.Category, isLink: false)

            Spacer()
        }
        .padding()
        .navigationTitle("API Detail")
    }
}

struct EntryView: View {
    let title: String
    let content: String
    let isLink: Bool

    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.bold)
                .frame(width: 120, alignment: .leading)
            if isLink {
                Link(content, destination: URL(string: content)!)
                    .foregroundColor(.blue)
                    .lineLimit(3)
            } else {
                Text(content)
                    .foregroundColor(isLink ? .blue : .black) // Kék a link, fekete a többi
                    .lineLimit(3)
            }
            Spacer()
        }
    }
}

