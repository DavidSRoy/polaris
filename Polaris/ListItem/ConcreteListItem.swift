//
//  ConcreteListItem.swift
//  Polaris
//
//  Created by David Roy on 10/5/23.
//

import PolarisCore

protocol PolarisListItem {
    var name: String { get set }
    var isMarkedComplete: Bool { get set }
    var markedCompleteDate: Date? { get set }
    var id: String { get set }
}

class ConcreteListItem: PolarisListItem {
    var name: String {
        didSet {
            print("GOLF_HOTEL Polaris name set to \(name)")
        }
    }
    var isMarkedComplete: Bool
    var markedCompleteDate: Date?
    var id: String

    convenience init(name: String) {
        self.init(name: name, isMarkedComplete: false)
    }

    convenience init(from listItem: ListItem) {
        self.init(name: listItem.name,
                  isMarkedComplete: listItem.isMarkedComplete,
                  markedCompleteDate: listItem.markedCompleteDate,
                  id: listItem.id)
    }

    private init(name: String,
                 isMarkedComplete: Bool,
                 markedCompleteDate: Date? = nil,
                 id: String = UUID().uuidString) {
        self.name = name
        self.isMarkedComplete = isMarkedComplete
        self.markedCompleteDate = markedCompleteDate
        self.id = id
    }
}
