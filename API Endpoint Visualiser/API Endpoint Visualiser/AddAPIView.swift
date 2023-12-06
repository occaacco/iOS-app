//
//  AddAPIView.swift
//  API Endpoint Visualiser
//
//  Created by Samuel Benko on 2023. 12. 05..
//

// AddAPIView.swift

import SwiftUI

struct AddAPIView: View {
    @Binding var isPresented: Bool
    @State private var newAPIEndpoint: String = ""

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
                        // Then dismiss the AddAPIView
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

