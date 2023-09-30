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
            ForEach(listViewModel.listItems, id: \.id) { listItem in
                HStack {
                    ListItemView(listItem: listItem)
                    Spacer()
                }
                .padding([.leading, .trailing, .bottom])
            }
        }
        .padding(.all)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

