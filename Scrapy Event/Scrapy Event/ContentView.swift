//
//  ContentView.swift
//  Scrapy Event
//
//  Created by Samuel Benko on 2023. 12. 06..
//
import SwiftUI

struct ContentView: View {
    let jsonData: [PageData]

    init() {
        self.jsonData = JSONService.load("informations.json")
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(jsonData) { page in
                    Section(header: Text(page.name)) {
                        ForEach(page.events) { event in
                            NavigationLink(destination: PageDetailsView(data: event)) {
                                Text(event.Performer)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Scrapped Pages")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
