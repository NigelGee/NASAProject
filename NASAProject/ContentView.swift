//
//  ContentView.swift
//  NASAProject
//
//  Created by Nigel Gee on 20/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var items = [Item]()

    var body: some View {
        NavigationView {
            VStack {
                if items.isEmpty {
                    ProgressView()
                } else {
                    List(items) { item in
                        NavigationLink {
                            DetailsView(item: item)
                        } label: {
                            HStack {
                                AsyncImage(url: URL(string: item.links[0].href)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(10)

                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 100, height: 100)


                                VStack(alignment: .leading) {
                                    Text(item.data[0].location)
                                        .font(.headline)
                                    Text(item.data[0].dateCreated, style: .date)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("NASA")
            .padding()
            .task { await fetch() }
        }
    }

    /// Call for get JSON data from URL
    /// requires `@State private var name = [Decodable]()`
    /// and `.task { await fetch() }`
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

