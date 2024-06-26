//
//  ContentView.swift
//  CoreDataTutorial
//
//  Created by 허예은 on 6/25/24.
//

import SwiftUI

struct Car: Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Section")) {
                    Text("A").listRowSeparator(.hidden)
                    Text("B").listRowSeparatorTint(.green)
                    Text("C").listRowSeparatorTint(.red)
                    Text("D").listRowBackground(Color.green)
                }
            }.navigationTitle(Text("Todo List"))
        }
    }
}

#Preview {
    ContentView()
}
