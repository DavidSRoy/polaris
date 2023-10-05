//
//  FirebaseService.swift
//  Polaris
//
//  Created by David Roy on 10/4/23.
//

import FirebaseFirestore
import FirebaseAuth
import FirebaseCore
import PolarisCore

public protocol CloudConnectionHelper {
    func signInAnonymously()

    func loadListItems(for userId: String, listId: String) -> [ListItem]
}

public final class FirebaseHelper: CloudConnectionHelper {

    public static let shared = FirebaseHelper()

    private init() {
        FirebaseApp.configure()
    }

    public func signInAnonymously() {
        Auth.auth().signInAnonymously { authResult, error in
            print("AuthResult = \(String(describing: authResult))")
            print("Error = \(String(describing: error))")
        }
    }

    public func loadListItems(for userId: String, listId: String) -> [ListItem] {
        let database = Firestore.firestore()
        let listItemsRef = database.document("users/test-user-id/lists/list-id")

        listItemsRef.getDocument { (document, error) in
            print("document = \(String(describing: document))")
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Error = \(error)")
                print("Document does not exist")
            }
        }

        return [
            ListItem(name: "Test1"),
            ListItem(name: "Test2"),
            ListItem(name: "Test3"),
            ListItem(name: "Test4")
        ]
    }
}
