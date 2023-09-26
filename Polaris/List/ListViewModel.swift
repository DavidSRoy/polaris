//
//  ListViewModel.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var listItems: [ListItem] = [
        ListItem(name: "Test1", isMarkedComplete: false, id: 0),
        ListItem(name: "Test2", isMarkedComplete: false, id: 1),
        ListItem(name: "Test3", isMarkedComplete: true, id: 2),
        ListItem(name: "Test4", isMarkedComplete: true, id: 3),
    ]
}


