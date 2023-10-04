//
//  ListViewModel.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

import CloudConnectionLayer
import PolarisCore


final class ListViewModel: ObservableObject {

    @Published var listItems: [ListItem] = []

    init() {
        listItems = FirebaseHelper.shared.loadListItems(for: "test", listId: "test")
    }

    func add(_ listItem: ListItem) {
        listItems.append(listItem)
    }
    
}
