//
//  ListItemView.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

import SwiftUI

struct ListItemView: View {
    @StateObject private var listItemViewModel: ListItemViewModel
    
    init(listItem: ListItem) {
        self._listItemViewModel = StateObject(wrappedValue: ListItemViewModel(listItem: listItem))
    }
    
    var body: some View {
        HStack {
            Button {
                listItemViewModel.toggleIsMarkedComplete()
            } label: {
                Image(systemName: listItemViewModel.isMarkedComplete ? "checkmark.square.fill" : "square")
                    .font(.title)
            }
            TextField(listItemViewModel.name, text: $listItemViewModel.name)
                .font(.title)
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let listItem = ListItem(name: "Test1",
                                isMarkedComplete: true)
        ListItemView(listItem: listItem)
    }
}
