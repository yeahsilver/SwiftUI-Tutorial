//
//  ListView.swift
//  TodoList
//
//  Created by 허예은 on 6/26/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        ZStack {
            
            if listViewModel.items.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: !listViewModel.items.isEmpty ? listViewModel.deleteItem : nil)
                    .onMove(perform: !listViewModel.items.isEmpty ? listViewModel.moveItem :nil )
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
            .toolbar() {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add", destination: AddView())
                }
            }
    }
}

#Preview {
    NavigationView {
        ListView()
    }.environmentObject(ListViewModel())
}
