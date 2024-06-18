//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by 허예은 on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    @State var isFileOpened: Bool = true
    
    
    var body: some View {
        var title: String = "File Closed"
        
        if(isFileOpened) {
            title = "File Opened"
        }
        func buttonPressed() {
            
        }
        
        return
            
            CustomVStack(content: {
                Text(title)
                    .modifier(TitleViewModifier())
                Text("Goodbye World")
                Button(action: buttonPressed) {
                   Image(systemName: "square.and.arrow.down")
                }
            })
          
     
        
    }
}

struct TitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.largeTitle).background(.white).border(.gray, width: 0.2).shadow(color: .black, radius: 5, x: 0, y: 5)
    }
}

struct CustomVStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        HStack(spacing: 10) {
            content()
        }.font(.largeTitle).lineLimit(1)
    }
}

#Preview {
    ContentView()
}