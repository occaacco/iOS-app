//
//  PageDetailsView.swift
//  Scrapy Event
//
//  Created by Samuel Benko on 2023. 12. 06..
//
import SwiftUI

struct PageDetailsView: View {
    let data: EventData

    var body: some View {
        VStack {
            InfoBox(title: "Performer:", content: data.Performer, color: .blue)
            InfoBox(title: "Link:", content: data.Link, color: .blue)
            InfoBox(title: "Date:", content: data.Date, color: .blue)
        }
        .padding(.top) // A tartalom felső részére igazítás
        .navigationBarTitle(data.id.uuidString, displayMode: .inline)
    }
}

struct InfoBox: View {
    let title: String
    let content: String
    let color: Color

    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.bold)
                .padding(.bottom, 4)
            Text(content)
                .padding()
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

struct PageDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PageDetailsView(data: EventData(Link: "https://example.com/page1", Performer: "Performer 1", Date: "2023-12-06"))
    }
}
