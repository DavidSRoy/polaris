//
//  ListItemView.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

import SwiftUI
import PolarisCore

struct ListItemView: View {
    @StateObject var listItemViewModel: ListItemViewModel

    private var onDelete: () -> Void

    init(listItem: PolarisListItem, onDelete: @escaping () -> Void) {
        self._listItemViewModel = StateObject(wrappedValue: ListItemViewModel(listItem: listItem))
        self.onDelete = onDelete
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
        .swipeActions(allowsFullSwipe: true) {
            Button {
                onDelete()
            } label: {
                Image(systemName: "trash")
            }
            .tint(.red)
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let listItems =
        [
            ConcreteListItem(name: "Test1"),
            ConcreteListItem(name: "Test2"),
            ConcreteListItem(name: "Test3")
        ]

        List {
            ForEach(listItems, id: \.id) { listItem in
                ListItemView(listItem: listItem) {
                    print("Preview: deleting \(listItem.id)")
                }
            }
        }
    }
}
