//
//  NoItemView.swift
//  TodoList
//
//  Created by 허예은 on 6/26/24.
//

import SwiftUI

struct NoItemView: View {
    @State var isAnimated: Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add butto n and add a bunch of items to your todo list!").padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something 🥳")
                            .foregroundStyle(Color.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(isAnimated ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                   
                    })
                .padding(.horizontal, isAnimated ? 30 : 50)
                .shadow(color: isAnimated ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7), 
                        radius: isAnimated ? 30 : 10, x: 0.0, y: isAnimated ? 50 : 30)
                .scaleEffect(isAnimated ? 1.1 : 1.0)
                .offset(y: isAnimated ? -7 : 0)
            }
                .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func addAnimation() {
        guard !isAnimated else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                isAnimated.toggle()
            }
        }
    }
}


#Preview {
    NavigationView {
        NoItemView().navigationTitle("Title")
    }
   
}
