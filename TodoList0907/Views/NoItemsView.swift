//
//  NoItemsView.swift
//  TodoList0907
//
//  Created by 林大屍 on 2021/9/19.
//

import SwiftUI

struct NoItemsView: View {
    @State private var animate = false
    let secAccentColor = Color("SecAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10.0) {
                Text("OOPS!!! \n It's empty 👽")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding(.bottom)
//                Text("You will never be happy if you continue to search for what happiness consists of. You will never live if you are looking for the meaning of life.")
//                Text("Albert Camus")
//                    .fontWeight(.semibold)
//                    .padding(.bottom)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("add something...")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    })
                    .padding(.horizontal, animate ? 30 : 50 )
                    .shadow(color: animate ? secAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                            radius: animate ? 30 : 20,
                            x: 0.0,
                            y: animate ? 50 : 30 )
                    .scaleEffect(animate ? 1.0 : 1.1 )
                    .offset(y: animate ? -5 : 0 )
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: 400)
            .padding()
            .onAppear(perform: addAnimation )
        }
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5)  {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
        }
        .navigationTitle("Title")
    }
}
