//
//  ListViewModel.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

import CloudConnectionLayer
import PolarisCore

final class ListViewModel: ObservableObject {

    @Published var listItems: [PolarisListItem] = []

    init() {
        listItems = FirebaseHelper.shared.loadListItems(for: "test", listId: "test")
            .map { ConcreteListItem(from: $0) }
    }

    func add(_ listItem: PolarisListItem) {
        listItems.append(listItem)
    }

    func delete(_ listItem: PolarisListItem) {
        listItems.removeAll { otherItem in
            otherItem.id == listItem.id
        }
        print("Deleted listItem id = \(listItem.id): \(listItem.name)")
    }
}
