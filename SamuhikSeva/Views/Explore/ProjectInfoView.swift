//
//  ProjectInfoView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 24/01/25.
//

import SwiftUI

import SwiftUI

struct ProjectInfoView: View {
    let project: Project
    @State private var showDetail = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Title with NavigationLink
            Button(action: {
                showDetail.toggle()
            }) {
                Text(project.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .lineLimit(2) // Ensure title wraps within two lines
                    .multilineTextAlignment(.center) // Center-align text
                    .frame(maxWidth: .infinity) // Allow text to use full width
            }
            .sheet(isPresented: $showDetail) {
                ProjectDetailView(project: project)
            }

            // Short Description
            Text(project.short_description)
                .font(.subheadline)
                .foregroundColor(.black)
                .lineLimit(6)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
