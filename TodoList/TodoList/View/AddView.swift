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
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $text)
                    .padding(20)
                    .frame(height: 55)                
                    .background(Color(UIColor.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .autocorrectionDisabled()
                
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
            .alert(isPresented: $showAlert) {
                getAlert()
            }
    }
    
    private func saveButtonPressed() {
        if(textIsAppropriate()) {
            listViewModel.addItem(title: text)
            dismiss()
        }
    }
    
    private func textIsAppropriate() -> Bool {
        if(text.count < 3) {
            alertTitle = "Your new todo item must be at lease 3 characters long."
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
    private func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }.environmentObject(ListViewModel())
}
