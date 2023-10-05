//
//  ListItem.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

public protocol ListItem {
    var name: String { get }
    var isMarkedComplete: Bool { get }
    var markedCompleteDate: Date? { get }
    var id: String { get }
}
