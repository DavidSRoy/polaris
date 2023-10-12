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
                                listViewModel.delete(listItem)
                            }
                            Spacer()
                        }
                    }
                    HStack {
                        Spacer()
                        Button {
                            listViewModel.add(ConcreteListItem(name: ""))
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
