//
//  ContentView-ViewModel.swift
//  NASAProject
//
//  Created by Nigel Gee on 21/12/2021.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var items = [Item]()

        func fetch() async {
            do  {
                let userURL = URL(string: "https://images-api.nasa.gov/search?media_type=image")!
                async let userItems = try await URLSession.shared.decode(
                    NASA.self, from: userURL,
                    keyDecodingStrategy: .convertFromSnakeCase,
                    dateDecodingStrategy: .iso8601
                )
                items = try await userItems.collection.items
            } catch {
                print("Failed to fetch data!")
            }
        }
    }
}
