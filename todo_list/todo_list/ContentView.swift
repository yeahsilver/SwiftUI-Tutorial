//
//  ContentView.swift
//  todo_list
//
//  Created by 허예은 on 6/22/24.
//

import SwiftUI

struct TodoListItemData: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var isChecked: Bool
}

struct ContentView: View {
    @State private var todoList = [
        TodoListItemData(title: "A", isChecked: false),
        TodoListItemData(title: "B", isChecked: false),
        TodoListItemData(title: "C", isChecked: false),
        TodoListItemData(title: "D", isChecked: false),
        TodoListItemData(title: "E", isChecked: false),
    ]
    
    private func removeList(at offsets: IndexSet) {
        todoList.remove(atOffsets: offsets)
    }
    
    private func moveList(from source: IndexSet, to destination: Int) {
        todoList.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        @State var multiSelection = Set<UUID>()
        
        NavigationView {
            List(selection: $multiSelection) {
                ForEach(todoList, id: \.self) {
                    data in Text(data.title)
                }
                .onDelete(perform: removeList)
                .onMove(perform: moveList)
            }
            .navigationTitle("Todo List")
            .toolbar { EditButton() }
        }
    }
}

#Preview {
    ContentView()
}
