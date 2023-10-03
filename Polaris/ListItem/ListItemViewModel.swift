//
//  ListItemViewModel.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

import Foundation

final class ListItemViewModel: ObservableObject {
    // TODO: Add thread safety

    @Published var name = "" {
        didSet {
            listItem.name = name
        }
    }

    @Published var isMarkedComplete = false {
        didSet {
            listItem.isMarkedComplete = isMarkedComplete
        }
    }

    @Published var markedCompleteDate: Date? {
        didSet {
            listItem.markedCompleteDate = markedCompleteDate
        }
    }

    private var listItem: ListItem

    init(listItem: ListItem) {
        self.listItem = listItem
        setProperties()
    }

    private func setProperties() {
        self.name = listItem.name
        self.isMarkedComplete = listItem.isMarkedComplete
        self.markedCompleteDate = listItem.markedCompleteDate
    }

    func listItemDidChange(to newListItem: ListItem) {
        self.listItem = newListItem
        setProperties()
    }

    func toggleIsMarkedComplete() {
        self.isMarkedComplete = !isMarkedComplete
    }
}
