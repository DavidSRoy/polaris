//
//  ListView.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

import SwiftUI

struct ListView: View {
    @StateObject private var listViewModel = ListViewModel()
    var body: some View {
        VStack {
            List(listViewModel.listItems, id: \.id) { listItem in
                ListItemView(listItem: listItem)
            }
        }
        .padding()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

