//
//  ListViewModelTests.swift
//  PolarisTests
//
//  Created by David Roy on 10/12/23.
//

import XCTest
@testable import Polaris

final class ListViewModelTests: XCTestCase {
    var subject: ListViewModel!
    var listItem: ConcreteListItem!
    var listItem2: ConcreteListItem!

    override func setUp() {
        let testName = "Test Item 1"
        listItem = ConcreteListItem(name: testName)
        listItem2 = ConcreteListItem(name: testName)
        subject = .init()

        subject.listItems = []
    }

    func testAdd() {
        subject.add(listItem)

        XCTAssertEqual(subject.listItems.count, 1)
        XCTAssertEqual(subject.listItems[0].name, listItem.name)
    }

    func testDelete() {
        testAdd()

        subject.delete(listItem)

        XCTAssertEqual(subject.listItems.count, 0)
    }

    func testAddItemWithSameName() {
        testAdd()

        subject.add(listItem2)

        XCTAssertEqual(subject.listItems.count, 2)
        XCTAssertEqual(subject.listItems[0].name, subject.listItems[1].name)
    }

    func testDeleteWithDuplicateNames() {
        testAddItemWithSameName()

        subject.delete(listItem2)

        XCTAssertEqual(subject.listItems.count, 1)
        XCTAssertEqual(subject.listItems[0].id, listItem.id)
    }
}
