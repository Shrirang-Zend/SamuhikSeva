//
//  TopBar.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//

import SwiftUI

struct TopBar: View {
    let title: String
    var rightButton: AnyView? // Optional right button (e.g., Cart, Notification)
    @Binding var isDrawerOpen: Bool

    var body: some View {
        HStack {
            // Drawer Button
            Button(action: {
                withAnimation {
                    isDrawerOpen.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .foregroundColor(Color.green)
            }
            .padding(.leading)

            Spacer()

            // Title
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            Spacer()

            // Right Action Button
            if let rightButton = rightButton {
                rightButton
                    .padding(.trailing)
            }
        }
        .padding(.vertical)
        .background(Color.white)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
