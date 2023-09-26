//
//  ListItemView.swift
//  Polaris
//
//  Created by David Roy on 9/26/23.
//

import SwiftUI

struct ListItemView: View {
    @StateObject private var listItemViewModel: ListItemViewModel
    
    init(listItem: ListItem) {
        self._listItemViewModel = StateObject(wrappedValue: ListItemViewModel(listItem: listItem))
    }
    
    var body: some View {
        HStack {
            Text(listItemViewModel.name)
            Spacer()
            Button {
                listItemViewModel.toggleIsMarkedComplete()
            } label: {
                Image(systemName: listItemViewModel.isMarkedComplete ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let listItem = ListItem(name: "Test1",
                                isMarkedComplete: true,
                                id: 32)
        ListItemView(listItem: listItem)
    }
}
