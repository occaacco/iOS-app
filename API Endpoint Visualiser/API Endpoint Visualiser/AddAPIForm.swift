//
//  AddAPIForm.swift
//  API Endpoint Visualiser
//
//  Created by Samuel Benko on 2023. 12. 05..
//

import SwiftUI

struct ContentView: View {
    @State private var apiData: APIData?
    @State private var isAddAPIPresented = false
    @State private var newAPIEndpoint = ""

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
            .navigationBarItems(
                trailing: HStack {
                    Button("Add") {
                        isAddAPIPresented = true
                    }
                }
            )
            .sheet(isPresented: $isAddAPIPresented) {
                AddAPIForm(isPresented: $isAddAPIPresented, apiData: $apiData, newAPIEndpoint: $newAPIEndpoint)
            }
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

struct AddAPIForm: View {
    @Binding var isPresented: Bool
    @Binding var apiData: APIData?
    @Binding var newAPIEndpoint: String

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter API Endpoint", text: $newAPIEndpoint)
                }

                Section {
                    Button("Add API") {
                        // Add the logic to save the newAPIEndpoint
                        // For example, you can save it to UserDefaults or another storage
                        // and refresh the apiData
                        isPresented = false
                    }
                }
            }
            .navigationTitle("Add API")
            .navigationBarItems(trailing: Button("Cancel") {
                isPresented = false
            })
        }
    }
}

