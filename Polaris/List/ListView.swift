//
//  ListView.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

import SwiftUI
import PolarisCore

struct ListView: View {
    @StateObject private var listViewModel = ListViewModel()
    var body: some View {
        NavigationView {
                List {
                    ForEach(listViewModel.listItems, id: \.id) { listItem in
                        HStack {
                            ListItemView(listItem: listItem) {
                                print("Deleted listItem id = \(listItem.id): \(listItem.name)")
                                listViewModel.listItems.removeAll { otherItem in
                                    otherItem.id == listItem.id
                                }
                            }
                            Spacer()
                        }
                    }
                    HStack {
                        Spacer()
                        Button {
                            listViewModel.add(ListItem(name: ""))
                        } label: {
                            Image(systemName: "plus")
                                .font(.title)
                        }
                        Spacer()
                    }
                }
                .navigationTitle("My List")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
