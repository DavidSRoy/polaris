//
//  ConcreteListItem.swift
//  CloudConnectionLayer
//
//  Created by David Roy on 10/5/23.
//

import PolarisCore

class ConcreteListItem: ListItem {
    var name: String
    var isMarkedComplete: Bool
    var markedCompleteDate: Date?
    var id: String

    convenience init(name: String) {
        self.init(name: name, isMarkedComplete: false)
    }

    init(name: String, isMarkedComplete: Bool, markedCompleteDate: Date? = nil) {
        self.name = name
        self.isMarkedComplete = isMarkedComplete
        self.markedCompleteDate = markedCompleteDate
        self.id = UUID().uuidString
    }
}
