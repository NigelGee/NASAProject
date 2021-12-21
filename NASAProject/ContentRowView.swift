//
//  ContentRowView.swift
//  NASAProject
//
//  Created by Nigel Gee on 21/12/2021.
//

import SwiftUI

struct ContentRowView: View {
    let item: Item

    var body: some View {
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

