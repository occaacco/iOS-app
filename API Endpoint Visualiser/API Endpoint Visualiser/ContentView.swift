//
//  ContentView.swift
//  API Endpoint Visualiser
//
//  Created by Samuel Benko on 2023. 12. 05..
//

// ContentView.swift

import SwiftUI

struct ContentView: View {
    @State private var apiData: APIData?

    var body: some View {
        NavigationView {
            VStack {
                if let apiData = apiData {
                    List(apiData.entries, id: \.API) { entry in
                        NavigationLink(
                            destination: DetailView(apiEntry: entry),
                            label: {
                                Text(entry.API)
                            }
                        )
                    }
                } else {
                    ProgressView("Loading...")
                }
            }
            .onAppear {
                fetchData()
            }
            .navigationTitle("API List")
        }
    }

    func fetchData() {
        guard let url = URL(string: "https://api.publicapis.org/entries") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(APIData.self, from: data)
                    DispatchQueue.main.async {
                        self.apiData = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
