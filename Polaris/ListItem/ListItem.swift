//
//  ListItem.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

import Foundation

struct ListItem {
    var name: String
    var isMarkedComplete: Bool
    var markedCompleteDate: Date?
    var id: String
    
    init(name: String, isMarkedComplete: Bool, markedCompleteDate: Date? = nil) {
        self.name = name
        self.isMarkedComplete = isMarkedComplete
        self.markedCompleteDate = markedCompleteDate
        self.id = UUID().uuidString
    }
}
