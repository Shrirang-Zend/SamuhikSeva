//
//  StatRow.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//


import SwiftUI

struct StatRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}
