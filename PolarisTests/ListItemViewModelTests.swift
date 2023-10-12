//
//  ListItemViewModelTests.swift
//  PolarisTests
//
//  Created by David Roy on 10/12/23.
//

import XCTest
@testable import Polaris

final class ListItemViewModelTests: XCTestCase {
    var subject: ListItemViewModel!
    var listItem: ConcreteListItem!

    override func setUp() {
        listItem = .init(name: "Test List Item")
        subject = .init(listItem: listItem)
    }

    func testListItemDidChangeChangesListItem() {
        let newName = "New List Item"
        let newListItem = ConcreteListItem(name: newName)
        let testDate = Date.now

        newListItem.isMarkedComplete = true
        newListItem.markedCompleteDate = testDate

        subject.listItemDidChange(to: newListItem)

        XCTAssertEqual(subject.name, newName)
        XCTAssertEqual(subject.isMarkedComplete, true)
        XCTAssertEqual(subject.markedCompleteDate, testDate)
    }

    func testInitWithListItem() {
        XCTAssertEqual(subject.name, listItem.name)
        XCTAssertEqual(subject.isMarkedComplete, listItem.isMarkedComplete)
        XCTAssertEqual(subject.markedCompleteDate, listItem.markedCompleteDate)
    }

    func testToggleIsMarkedCompleteTogglesFromFalseToTrue() {
        subject.isMarkedComplete = false
        subject.toggleIsMarkedComplete()

        XCTAssertEqual(subject.isMarkedComplete, true)
    }

    func testToggleIsMarkedCompleteTogglesFromTrueToFalse() {
        subject.isMarkedComplete = true

        subject.toggleIsMarkedComplete()

        XCTAssertEqual(subject.isMarkedComplete, false)
    }
}
