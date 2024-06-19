//
//  ContentView.swift
//  Test Siri App
//
//  Created by Travis Wadman on 6/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var key: String = ""
    @State private var result: String = ""

    var body: some View {
        VStack {
            TextField("Enter key (wellName, oil, water)", text: $key)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Fetch Value") {
                fetchValue(for: key)
            }
            .padding()

            Text("Result: \(result)")
                .padding()
        }
        .padding()
    }

    func fetchValue(for key: String) { // Testing FetchValueIntent function: 
            Task {
                do {
                    // Initialize the intent with the key
                    let intent = FetchValueIntent()
                    intent.key = key // Assign the key directly
                    let response = try await intent.perform()
                    
                    // Extract and assign the result
                    if let resultValue = response.value {
                        result = resultValue
                    } else {
                        result = "Unexpected response"
                    }
                } catch {
                    result = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
