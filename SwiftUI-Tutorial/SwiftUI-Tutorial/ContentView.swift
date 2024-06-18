//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by 허예은 on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userName = "Hi"
    @State private var isOn = false
    
    var body: some View {
        return CustomVStack(content: {
                Text(userName)
                    .modifier(TitleViewModifier())
            TextField("Enter your name", text: $userName)
                .border(.gray, width: 1)
                .padding(.all, 20)
            
            HStack{
                Toggle(isOn: $isOn, label: {
                    /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
                })
                CustomToggle(isOn: $isOn)
            }
        })
    }
}

struct CustomToggle: View {
    @Binding var isOn: Bool
    
    var body: some View {
        return Image(systemName: isOn ? "wifi" : "wifi.slash")
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
        VStack(spacing: 10) {
            content()
        }.font(.largeTitle).lineLimit(1)
    }
}

struct CustomListView: View {
    var body: some View {
        return ScrollView(content: {
            LazyVStack {
                ForEach(1...100, id: \.self) {
                    i in
                    VStack{
                        Capsule().fill(.blue).frame(width: 100, height: 50)
                        Text("Row \(i)")
                            .padding(.all, 10)
                    }
                }
            }
        })
    }
}


#Preview {
    ContentView()
}
