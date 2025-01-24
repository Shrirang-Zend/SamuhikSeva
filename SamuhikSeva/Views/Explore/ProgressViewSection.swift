//
//  ProgressViewSection.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 24/01/25.
//

import SwiftUI

struct ProgressViewSection: View {
    let project: Project

    var body: some View {
        VStack(spacing: 10) {
            Text("Goal: ₹\(project.funding_goal)")
                .font(.footnote)
                .foregroundColor(.green)
                .multilineTextAlignment(.center)

            ProgressView(value: Double(project.funding_received) / Double(project.funding_goal))
                .progressViewStyle(LinearProgressViewStyle(tint: .green))
                .frame(height: 8)
                .clipShape(RoundedRectangle(cornerRadius: 4))

            Text("\(Int((Double(project.funding_received) / Double(project.funding_goal)) * 100))% completed")
                .font(.caption)
                .foregroundColor(.blue)
        }
    }
}
