//
//  DetailsView.swift
//  NASAProject
//
//  Created by Nigel Gee on 20/12/2021.
//

import SwiftUI

struct DetailsView: View {
    let item: Item

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: item.links[0].href)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)

                } placeholder: {
                    ProgressView()
                }
                .frame(height: 300)

                Text(item.data[0].dateCreated, style: .date)
                    .padding(.bottom)

                Text(item.data[0].description)
            }
            .padding(.horizontal)
        }
        .navigationTitle(item.data[0].location)
        .navigationBarTitleDisplayMode(.inline)
    }
}

