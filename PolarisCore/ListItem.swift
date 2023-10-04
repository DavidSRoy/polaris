//
//  ListItem.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

public struct ListItem {
    public var name: String
    public var isMarkedComplete: Bool
    public var markedCompleteDate: Date?
    public var id: String

    public init(name: String) {
        self.init(name: name, isMarkedComplete: false)
    }

    init(name: String, isMarkedComplete: Bool, markedCompleteDate: Date? = nil) {
        self.name = name
        self.isMarkedComplete = isMarkedComplete
        self.markedCompleteDate = markedCompleteDate
        self.id = UUID().uuidString
    }
}
