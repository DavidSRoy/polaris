//
//  ListViewModel.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

final class ListViewModel: ObservableObject {

    @Published var listItems: [ListItem] = []

    init() {
        loadListItems()
    }

    func add(_ listItem: ListItem) {
        listItems.append(listItem)
    }
    
    func loadListItems() {
        let database = Firestore.firestore()
        let listItemsRef = database.document("users/test-user-id/lists/list-id")

        listItemsRef.getDocument { (document, error) in
            print("document = \(String(describing: document))")
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }

        listItems = [
            ListItem(name: "Test1", isMarkedComplete: false),
            ListItem(name: "Test2", isMarkedComplete: true),
            ListItem(name: "Test3", isMarkedComplete: true),
            ListItem(name: "Test4", isMarkedComplete: false)
        ]
    }
}
