//
//  ListRowView.swift
//  TodoList
//
//  Created by 허예은 on 6/26/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle").foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
            .font(.title3)
            .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListRowView(item: ItemModel(title: "First Item!", isCompleted: false))
}

#Preview(traits: .sizeThatFitsLayout) {
    ListRowView(item: ItemModel(title: "Second Item!", isCompleted: true))
}
