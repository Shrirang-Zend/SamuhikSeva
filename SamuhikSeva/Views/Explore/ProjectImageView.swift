//
//  ProjectImageView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 24/01/25.
//

import SwiftUI

struct ProjectImageView: View {
    let project: Project

    var body: some View {
        if let imageName = project.image, !imageName.isEmpty {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 250)
                .cornerRadius(10)
                .overlay(
                    Text(project.location)
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding(10)
                )
        } else {
            Rectangle()
                .fill(Color.gray)
                .frame(maxWidth: .infinity, maxHeight: 250)
                .cornerRadius(10)
                .overlay(
                    Text("Image Unavailable")
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                )
        }
    }
}
