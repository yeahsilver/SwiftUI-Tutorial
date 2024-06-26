//
//  AddView.swift
//  TodoList
//
//  Created by 허예은 on 6/26/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var text: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $text)
                    .padding(20)
                    .frame(height: 55)                .background(Color(red: 228/255, green: 230/255, blue: 240/255))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: saveButtonPressed) {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }.padding(14)
        }.navigationTitle("Add an Item 🖊️")
    }
    
    private func saveButtonPressed() {
        listViewModel.addItem(title: text)
        dismiss()
    }
}

#Preview {
    NavigationView {
        AddView()
    }.environmentObject(ListViewModel())
}
