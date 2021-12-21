//
//  ContentView.swift
//  NASAProject
//
//  Created by Nigel Gee on 20/12/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.items.isEmpty {
                    ProgressView()
                } else {
                    List(viewModel.items) { item in
                        NavigationLink {
                            DetailsView(item: item)
                        } label: {
                            ContentRowView(item: item)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("NASA")
            .padding()
            .task { await viewModel.fetch() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

